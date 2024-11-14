//
// Created by yerik on 11/8/24.
//

// You may need to build the project (run Qt uic code generator) to get "ui_Register.h" resolved

#include "register.h"
#include "ui_Register_UI.h"


Register::Register(QWidget *parent, Socket *socket) :
    QMainWindow(parent), ui(new Ui::Regiter_UI) {
    ui->setupUi(this);
    this->socket = socket;
    connect(ui->pushButton_2, &QPushButton::clicked, this, &Register::registerData);
}

Register::~Register() {
    delete ui;
}

void Register::registerData() {
    if(ui->lineEdit->text().isEmpty()||ui->lineEdit_2->text().isEmpty()||ui->lineEdit_3->text().isEmpty()) {
        std::cout << "Llene todo mamahuevo "<<std::endl;
    }else {
        if(ui->lineEdit->text().endsWith("@LamberMail.com")) {
            if(!ui->lineEdit_2->text().compare(ui->lineEdit_3->text())) {
                Encription enc;
                std::pair<std::vector<unsigned char>, std::vector<int>> result =enc.encrypt(ui->lineEdit_2->text().toStdString());
                std::string password(result.first.begin(), result.first.end());
                std::string key="";
                for (int num : result.second) {
                    key += std::to_string(num)+",";
                }

                socket->sendMessageToServer("R:" + ui->lineEdit->text().toStdString() + ":" + password + ":" + key);
                bool waiting = true;
                while(waiting) {
                    if(socket->lastmsjRcvd=="") {

                    }else {
                        if(socket->lastmsjRcvd == "Exito") {
                            std::cout << "Todo piola "<<std::endl;
                        }else {
                            std::cout << "Usuario ya existe "<<std::endl;
                        }
                        socket->lastmsjRcvd = "";
                        waiting=false;
                    }
                }


            }else {
                std::cout << "No coinciden contraseñas "<<std::endl;
            }
        }else {
            std::cout << "Termine el correo con @LamberMail.com "<<std::endl;
        }
    }
}