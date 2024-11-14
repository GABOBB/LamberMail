//
// Created by yerik on 11/8/24.
//



#include <QApplication>
#include <iostream>
#include <sys/socket.h>
#include <netdb.h>
#include <cstring>
#include <string>
#include <unistd.h>
#include <arpa/inet.h>
#include <thread>

#include "Socket.h"

using namespace std;
//#include "LogIn.h"
#include "register.h"
//#include "mainwindow.h"




int main(int argc, char *argv[]){
    Socket sock;

    QApplication a(argc, argv);
    Register w = Register(nullptr, &sock);
    w.show();


    //enc.decrypt(result.first, result.second);
    return a.exec();
}
