//
// Created by yerik on 11/11/24.
//


#include <iostream>
#include <sys/socket.h>
#include <netdb.h>
#include <string.h>
#include <string>
#include <unistd.h>
#include <arpa/inet.h>

using namespace std;

int main(int argc, char *argv[]){
    //std::cout.setf(std::ios::unitbuf);
    //std::cerr.setf(std::ios::unitbuf);

    int listening = socket(AF_INET, SOCK_STREAM, 0);
    if (listening == -1) {
        cerr<<"socket fail"<<endl;
        return -1;
    }

    sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_port = htons(54000);
    inet_pton(AF_INET, "127.0.0.1", &address.sin_addr);

    if(bind(listening, (struct sockaddr*)&address, sizeof(address)) == -1) {
        cerr<<"bind fail"<<endl;
        return -2;
    }

    if(listen(listening, SOMAXCONN) == -1) {
        cerr<<"listen fail"<<endl;
        return -3;
    }

    //acepta la llamada
    sockaddr_in client;
    socklen_t C_len = sizeof(client);
    char host[NI_MAXHOST];
    char svc[NI_MAXSERV];

    int socket_cliente = accept(listening, (struct sockaddr*)&client, &C_len);

    if(socket_cliente == -1) {
        cerr<<"accept fail"<<endl;
        return -4;
    }

    close(listening);

    memset(host, 0, NI_MAXHOST);
    memset(svc, 0, NI_MAXSERV);

    int result = getnameinfo((struct sockaddr*)&client, sizeof(client),host, NI_MAXHOST, svc, NI_MAXSERV, 0);

    if(result) {
        cout<<host << " conectado con: "<<svc<<endl;
    }else {
        inet_ntop(AF_INET, &client.sin_addr, host, NI_MAXHOST);
        cout<<host<<" conectado con: "<<ntohs(client.sin_port)<<endl;
    }

    char buf[4096];
    while(true) {
        memset(buf, 0, 4096);
        int bytesR = recv(socket_cliente, buf, 4096, 0);
        if(bytesR == -1) {
            cerr<<"recv fail"<<endl;
            break;
        }
        if(bytesR == 0) {
            cout<<"el cliente se desconecto"<<endl;
            break;
        }
        cout<<"si"<<endl;
        //for(int i = 0; i < bytesR; i++) {cout<<buf[i]<<endl;}
        cout<< string(buf,bytesR+1) <<endl;

        send(socket_cliente, buf, bytesR+1, 0);
    }

    close(socket_cliente);
    //std::cout << "Server xdxd" << std::endl;
    return 0;
}