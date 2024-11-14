//
// Created by gabonm7 on 13/11/24.
//

// You may need to build the project (run Qt uic code generator) to get "ui_mail.h" resolved

#include "mail.h"
#include "ui_Mail_UI.h"


mail::mail(QWidget *parent) :
    QMainWindow(parent), ui(new Ui::mail) {
    ui->setupUi(this);
}

mail::~mail() {
    delete ui;
}
