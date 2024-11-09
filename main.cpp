//
// Created by yerik on 11/8/24.
//

//#include "LogIn.h"
#include "register.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Register w;
    w.show();
    return a.exec();
}