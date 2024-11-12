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
    socket->sendMessageToServer(ui->lineEdit->text().toStdString());
}