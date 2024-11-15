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
#include "LogIn.h"
//#include "register.h"
//#include "mainwindow.h"
//#include "mail.h"




int main(int argc, char *argv[]){
    Socket sock;
    Usuario usr=Usuario("");
    QApplication a(argc, argv);
    LogIn_UI w = LogIn_UI(nullptr, &sock,&usr);
    w.show();


    //enc.decrypt(result.first, result.second);
    return a.exec();
}
