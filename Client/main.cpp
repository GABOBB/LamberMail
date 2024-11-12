//
// Created by yerik on 11/8/24.
//

//#include "LogIn.h"
#include "register.h"
#include "Encription.h"
#include <QApplication>
//#include "mainwindow.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Register w;
    w.show();
    Encription enc;
    // Mensaje de prueba largo
    std::string longMessage = "Mensaje de Prueba para encriptacion";
    std::pair<std::vector<unsigned char>, std::vector<int>> result =enc.encrypt(longMessage);
    enc.decrypt(result.first, result.second);
    return a.exec();
}