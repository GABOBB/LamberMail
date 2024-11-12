//
// Created by yerik on 11/8/24.
//

//#include "LogIn.h"
#include "register.h"
#include "Encription.h"
#include <QApplication>
#include <iostream>
#include <sys/socket.h>
#include <netdb.h>
#include <cstring>
#include <string>
#include <unistd.h>
#include <arpa/inet.h>
using namespace std;
int main(int argc, char *argv[])
{

    // Crear el socket
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == -1) {
        cerr << "Error al crear el socket" << endl;
        return -1;
    }

    // Configurar la dirección del servidor
    sockaddr_in server;
    server.sin_family = AF_INET;
    server.sin_port = htons(54000);
    inet_pton(AF_INET, "127.0.0.1", &server.sin_addr);

    // Conectarse al servidor
    int connection = connect(sock, (struct sockaddr*)&server, sizeof(server));
    if (connection == -1) {
        cerr << "No se pudo conectar al servidor" << endl;
        return -2;
    }

    char buf[4096];
    string userInput;

    do {
        // Obtener entrada del usuario
        cout << "> ";
        getline(cin, userInput);

        // Enviar el texto al servidor
        int sendResult = send(sock, userInput.c_str(), userInput.size() + 1, 0);
        if (sendResult == -1) {
            cerr << "No se pudo enviar al servidor" << endl;
            continue;
        }

        // Esperar respuesta del servidor
        memset(buf, 0, 4096);
        int bytesReceived = recv(sock, buf, 4096, 0);
        if (bytesReceived == -1) {
            cerr << "Error al recibir respuesta del servidor" << endl;
            break;
        }

        // Mostrar la respuesta del servidor
        cout << "Servidor: " << string(buf, bytesReceived) << endl;

    } while (true);

    // Cerrar el socket
    close(sock);


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