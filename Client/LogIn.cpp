//
// Created by yerik on 11/8/24.
//

// You may need to build the project (run Qt uic code generator) to get "ui_LogIn_UI.h" resolved

#include "LogIn.h"
#include "ui_LogIn_UI.h"


LogIn_UI::LogIn_UI(QWidget *parent) :
    QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);
}

LogIn_UI::~LogIn_UI() {
    delete ui;
}
