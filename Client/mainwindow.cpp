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



}

MainWindow::~MainWindow() {
    delete ui;
}

void MainWindow::Update() {
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

                for (int j = 0; j < lastMessage.length(); j++) {
                    if (caso == 1) {
                        if (lastMessage[j] == ':') {
                            if (lastMessage[j + 1] != ':') {
                                caso = 2;
                            } else {
                                texto += lastMessage[j];
                            }
                        } else {
                            texto += lastMessage[j];
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
                        autor += lastMessage[j];
                    }
                }

                Encription enc;
                auto message = enc.decrypt(texto, key);
                std::string newMessage(message.begin(), message.end());

                // Agregar el mensaje al usuario
                user->addCorreo(Correos(autor, newMessage, key));

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
        for (const auto& correo : user->getCorreos()) {
            QString autor = QString::fromStdString(correo.getAutor());
            QString contenido = QString::fromStdString(correo.getContenido());
            ui->listWidget->addItem(autor + ": " + contenido);
        }
    });
}
void MainWindow::startUpdateThread() {
    // Inicializar y ejecutar el hilo
    std::thread updateThread(&MainWindow::Update, this);
    updateThread.detach();  // Desvincular el hilo para que se ejecute en segundo plano
}