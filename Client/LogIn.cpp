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
    connect(ui->pushButton_2,&QPushButton::clicked, this ,&LogIn_UI::mainwindowOpen);
    connect(ui->pushButton_3,&QPushButton::clicked, this,&LogIn_UI::registerWindow);
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
                    for (int j = 0; j < socket->lastmsjRcvd.length()-1; j++) {
                        if (caso==1) {
                            if(socket->lastmsjRcvd[j]==':') {
                                if(socket->lastmsjRcvd[j+1]!=':') {
                                    caso=2;
                                }else {
                                    password += socket->lastmsjRcvd[j];
                                }
                            }else {
                                password += socket->lastmsjRcvd[j];
                            }
                        }else if (caso==2) {
                            key+=socket->lastmsjRcvd[j];
                        }
                    }

                    Encription enc;
                    if(enc.compare(ui->lineEdit_2->text().toStdString(),key,password)) {
                        std::cout << "Inicio Exitoso" << std::endl;
                        user=ui->lineEdit->text().toStdString();
                        socket->lastmsjRcvd  = "";
                        waiting=false;
                    }else {
                        std::cout << "Inicio Fallido" << std::endl;
                        socket->lastmsjRcvd  = "";
                        waiting=false;
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
