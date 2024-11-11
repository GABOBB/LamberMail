//
// Created by yerik on 11/8/24.
//

// You may need to build the project (run Qt uic code generator) to get "ui_Register.h" resolved

#include "register.h"
#include "ui_Register_UI.h"


Register::Register(QWidget *parent) :
    QMainWindow(parent), ui(new Ui::Regiter_UI) {
    ui->setupUi(this);
}

Register::~Register() {
    delete ui;
}
