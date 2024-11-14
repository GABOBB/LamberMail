//
// Created by yerik on 11/13/24.
//

#ifndef SERVER_H
#define SERVER_H


#include <iostream>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <netdb.h>
#include <sys/select.h>
#include "Base.h"

class Server {
public:
    Server();
    ~Server();
    int startServer();

private:
    int listening;
    fd_set master_set;
    int max_fd;
    Base base;
};


#endif //SERVER_H
