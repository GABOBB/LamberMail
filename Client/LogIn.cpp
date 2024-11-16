//
// Created by yerik on 11/8/24.
//

// You may need to build the project (run Qt uic code generator) to get "ui_LogIn_UI.h" resolved

#include "LogIn.h"



LogIn_UI::LogIn_UI(QWidget *parent,Socket *socket,Usuario *usr) :
    QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);
    this->socket=socket;
    this->usuario= usr;
    ui->lineEdit_2->setEchoMode(QLineEdit::Password);
    ui->pushButton->setText("Show");
    connect(ui->pushButton_2,&QPushButton::clicked, this ,&LogIn_UI::mainwindowOpen);
    connect(ui->pushButton_3,&QPushButton::clicked, this,&LogIn_UI::registerWindow);
    connect(ui->pushButton,&QPushButton::clicked, this,&LogIn_UI::toggle);
}

LogIn_UI::~LogIn_UI() {
    delete ui;
}

void LogIn_UI::login() {
    if(ui->lineEdit->text().isEmpty()||ui->lineEdit_2->text().isEmpty()) {
        std::cout << "Llene los campos"<< std::endl;
    }else {
        socket->sendMessageToServer("L:" + ui->lineEdit->text().toStdString());
        bool waiting = true;
        while(waiting) {
            if(socket->lastmsjRcvd=="") {

            }else {
                if(socket->lastmsjRcvd==" : ") {
                    std::cout << "Usuario no existe" << std::endl;
                    socket->lastmsjRcvd  = "";
                    waiting = false;
                }else {
                    std::string password = "";
                    std::string key = "";
                    int caso=1;
                    int k=0;
                    for (int j = 0; j < socket->lastmsjRcvd.length(); j++) {
                        if (caso==1) {
                            if(socket->lastmsjRcvd[j]==':') {
                                if(socket->lastmsjRcvd[j+1]!=':') {
                                    caso=2;
                                }else {
                                    key += socket->lastmsjRcvd[j];
                                }
                            }else {
                                key += socket->lastmsjRcvd[j];
                            }
                        }else if (caso==2) {
                            password+=socket->lastmsjRcvd[j];
                        }
                    }
                    if(socket->lastmsjRcvd=="Exito") {
                        socket->lastmsjRcvd  = "";
                        waiting=false;
                    }else {
                        Encription enc;
                        if(enc.compare(ui->lineEdit_2->text().toStdString(),key,password)) {
                            std::cout << "Inicio Exitoso" << std::endl;
                            user=ui->lineEdit->text().toStdString();
                            socket->lastmsjRcvd  = "";
                        }else {
                            std::cout << "Inicio Fallido" << std::endl;
                            socket->lastmsjRcvd  = "";
                        }
                        password="";
                        key="";
                    }


                }
            }
        }
    }


}

void LogIn_UI::registerWindow() {
    Register *r = new Register(nullptr,socket, usuario);
    r->show();
    this->close();
}

void LogIn_UI::mainwindowOpen() {
    login();

    if(user!="") {
        usuario->setUsuario(user);
        MainWindow *w = new MainWindow(nullptr,socket, usuario);
        w->show();
        this->close();
    }

}

void LogIn_UI::toggle() {
    if (isPasswordMode) {
        ui->lineEdit_2->setEchoMode(QLineEdit::Normal); // Mostrar texto
        ui->pushButton->setText("Hide");
    } else {
        ui->lineEdit_2->setEchoMode(QLineEdit::Password); // Enmascarar texto
        ui->pushButton->setText("Show");
    }
    isPasswordMode = !isPasswordMode; // Alternar estado
}