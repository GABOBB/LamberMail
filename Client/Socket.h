//
// Created by yerik on 11/12/24.
//

#ifndef SOCKET_H
#define SOCKET_H

#include <condition_variable>
#include <cstring>
#include <iostream>
#include <qlineedit.h>
#include <queue>
#include <unistd.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <thread>
#include <atomic>

class Socket {
public:
    // Cola de mensajes y variables para sincronización
    std::atomic<bool> running;
    std::queue<std::string> messageQueue;
    std::mutex queueMutex;
    std::condition_variable queueCondition;
    std::string lastmsjRcvd="";

    Socket();

    ~Socket();

    void socketClientFunction();

    void sendMessageToServer(const std::string &message);

};



#endif //SOCKET_H
