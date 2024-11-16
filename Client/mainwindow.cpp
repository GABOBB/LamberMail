//
// Created by gabonm7 on 11/11/24.
//

// You may need to build the project (run Qt uic code generator) to get "ui_MainWindow.h" resolved

#include "mainwindow.h"

#include <QTimer>

#include "Encription.h"
#include "ui_MainWindow_UI.h"
std::mutex socketMutex;

MainWindow::MainWindow(QWidget *parent, Socket *socket, Usuario *user) :
    QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);
    this->socket=socket;
    this->user=user;
    QTimer::singleShot(0, this,&MainWindow::startUpdateThread);
    connect(ui->pushButton,&QPushButton::clicked,this, &MainWindow::NewMessage);
    connect(ui->pushButton_2,&QPushButton::clicked,this, &MainWindow::Update);
    connect(ui->pushButton_3,&QPushButton::clicked,this, &MainWindow::hideWidget);
    ui->widget->hide();



}

MainWindow::~MainWindow() {
    delete ui;
}

void MainWindow::Update() {
    user->refreshMail();
    socket->sendMessageToServer("U:" + user->getUsuario());
    bool waiting = true;

    while (waiting) {
        std::string lastMessage;
        {
            // Bloquear el acceso a socket->lastmsjRcvd para evitar conflictos de concurrencia
            std::lock_guard<std::mutex> lock(socketMutex);
            lastMessage = socket->lastmsjRcvd;
        }

        if (lastMessage.empty()) {
            continue;  // Si no hay mensaje nuevo, continuar esperando
        } else {
            if (lastMessage == "Error") {
                std::cout << "Usuario no tiene mensajes" << std::endl;
                {
                    std::lock_guard<std::mutex> lock(socketMutex);
                    socket->lastmsjRcvd = "";
                }
                waiting = false;
            } else if (lastMessage == "Exito") {
                std::cout << "No mas mensajes" << std::endl;
                {
                    std::lock_guard<std::mutex> lock(socketMutex);
                    socket->lastmsjRcvd = "";
                }
                waiting = false;
            } else {
                std::string texto = "";
                std::string key = "";
                std::string autor = "";
                int caso = 1;
                unsigned char c =0;

                for (int j = 0; j < lastMessage.length(); j++) {
                    if (caso == 1) {
                        if (lastMessage[j] == ':') {
                            if (lastMessage[j + 1] != ':') {
                                caso = 2;
                            } else {
                                autor += lastMessage[j];
                            }
                        } else {
                            autor += lastMessage[j];

                        }
                    } else if (caso == 2) {
                        if (lastMessage[j] == ':') {
                            if (lastMessage[j + 1] != ':') {
                                caso = 3;
                            } else {
                                key += lastMessage[j];
                            }
                        } else {
                            key += lastMessage[j];
                        }
                    } else if (caso == 3) {
                        texto += lastMessage[j];
                    }
                }

                Encription enc;
                auto message = enc.decrypt(texto, key);
                std::string topic ="";
                std::string mail = "";
                caso =1;
                for (int j = 0; j < message.length(); j++) {
                    if(caso==1) {
                        if (message[j] == ':') {
                            caso=2;
                        } else {
                            topic += message[j];
                        }
                    } else if (caso == 2) {
                        mail += message[j];
                    }
                }



                // Agregar el mensaje al usuario
                auto send = Correos(autor, topic,mail, key);
                user->addCorreo(send);

                // Limpiar el mensaje en socket
                {
                    std::lock_guard<std::mutex> lock(socketMutex);
                    socket->lastmsjRcvd = "";
                }
            }
        }
    }

    // Actualizar la interfaz después de recibir los mensajes
    QMetaObject::invokeMethod(this, [this]() {
        ui->listWidget->clear();
        const auto& correos = user->getCorreos();
        for (int i = correos.size() - 1; i >= 0; --i) {
            const auto& correo = correos[i];
            QString autor = QString::fromStdString(correo.getAutor());
            QString contenido = QString::fromStdString(correo.getTopic());

            // Crear un nuevo QListWidgetItem
            QListWidgetItem* item = new QListWidgetItem(autor + ": " + contenido);

            // Almacenar información adicional en el ítem usando `setData`
            item->setData(Qt::UserRole, QString::fromStdString(std::to_string(correo.getID())));
            item->setFlags(item->flags() & ~Qt::ItemIsSelectable);

            // Agregar el ítem al QListWidget
            ui->listWidget->addItem(item);
        }
        connect(ui->listWidget, &QListWidget::itemClicked, this, &MainWindow::manejarItemClicado);
    });

}
void MainWindow::startUpdateThread() {
    // Inicializar y ejecutar el hilo
    std::thread updateThread(&MainWindow::Update, this);
    updateThread.detach();  // Desvincular el hilo para que se ejecute en segundo plano
}

void MainWindow::NewMessage() {
    mail *m = new mail(nullptr, socket, user);
    m->show();
}

void MainWindow::manejarItemClicado(QListWidgetItem* item) {
    // Obtener información adicional almacenada en el ítem
    QString correoID = item->data(Qt::UserRole).toString();

    int id = correoID.toInt();
    realizarAccionConCorreo(id);
}

void MainWindow::realizarAccionConCorreo(int id) {
    ui->label_2->setText(QString::fromStdString(user->getCorreos()[id].getContenido()));
    ui->listWidget->hide();
    ui->widget->show();
    ui->widget->setEnabled(true);

}

void MainWindow::hideWidget() {
    ui->widget->hide();
    ui->widget->setEnabled(false);
    ui->listWidget->show();
}