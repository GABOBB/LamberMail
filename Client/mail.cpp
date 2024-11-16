//
// Created by gabonm7 on 13/11/24.
//

// You may need to build the project (run Qt uic code generator) to get "ui_mail.h" resolved

#include "mail.h"


mail::mail(QWidget *parent, Socket *socket, Usuario *user) :
    QMainWindow(parent), ui(new Ui::mail) {
    ui->setupUi(this);
    this->socket=socket;
    this->user=user;
    connect(ui->pushButton,&QPushButton::clicked, this ,&mail::send);
}

mail::~mail() {
    delete ui;
}

void mail::send() {
    if(ui->textEdit->toPlainText().isEmpty()||ui->textEdit_2->toPlainText().isEmpty()||ui->textEdit_3->toPlainText().isEmpty()) {
        std::cout<<"Llene todo"<<std::endl;
    }else {
        Encription enc;
        std::string topic = ui->textEdit->toPlainText().toStdString();
        topic.erase(std::remove(topic.begin(), topic.end(), ':'), topic.end());
        std::string texto = topic+":"+ui->textEdit_3->toPlainText().toStdString();
        std::pair<std::vector<unsigned char>, std::vector<int>> result =enc.encrypt(texto);
        std::string message(result.first.begin(), result.first.end());
        std::string key="";
        for (int num : result.second) {
            key += std::to_string(num)+",";
        }
        socket->sendMessageToServer("S:"+ui->textEdit_2->toPlainText().toStdString()+":"+message+":"+key+":"+user->getUsuario());
        bool waiting =true;
        while(waiting) {
            if(socket->lastmsjRcvd=="") {

            }else {
                if(socket->lastmsjRcvd == "Exito") {
                    std::cout << "Todo piola "<<std::endl;
                    this->close();
                }else {
                    std::cout << "Usuario no existe "<<std::endl;
                }
                socket->lastmsjRcvd = "";
                waiting=false;
            }
        }

    }


}

