//
// Created by yerik on 11/12/24.
//

#include "Socket.h"




Socket::Socket() : running(true) {  // Inicializamos `running` en true
    // Crear un hilo para la función del cliente de socket
    std::thread socketThread(&Socket::socketClientFunction, this);
    socketThread.detach();  // Desacoplar el hilo para que se ejecute en segundo plano
}

Socket::~Socket() {
    // Cambiar la variable a false para terminar el hilo
    running = false;
    queueCondition.notify_all();  // Despertar el hilo en espera (por si está esperando un mensaje)
}

// Función de cliente de socket
void Socket::socketClientFunction() {
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == -1) {
        std::cerr << "Error al crear el socket" << std::endl;
        return;
    }

    sockaddr_in server;
    server.sin_family = AF_INET;
    server.sin_port = htons(54000);
    inet_pton(AF_INET, "127.0.0.1", &server.sin_addr);

    int connection = connect(sock, (struct sockaddr*)&server, sizeof(server));
    if (connection == -1) {
        std::cerr << "No se pudo conectar al servidor" << std::endl;
        close(sock);
        return;
    }

    char buf[16384];

    while (running) {  // Continuar mientras `running` sea true
        std::string messageToSend;

        // Esperar hasta que haya un mensaje en la cola o se cierre el programa
        {
            std::unique_lock<std::mutex> lock(queueMutex);
            queueCondition.wait(lock, [this] { return !messageQueue.empty() || !running; });
            if (!running) break;  // Salir si `running` es false
            messageToSend = messageQueue.front();
            messageQueue.pop();
        }

        // Enviar el mensaje al servidor
        int sendResult = send(sock, messageToSend.c_str(), messageToSend.size() + 1, 0);
        if (sendResult == -1) {
            std::cerr << "No se pudo enviar al servidor" << std::endl;
            continue;
        }
        do {
            // Recibir la respuesta del servidor
            memset(buf, 0, 16384);
            int bytesReceived = recv(sock, buf, 16384, 0);
            if (bytesReceived > 0) {
                std::cout << "Servidor: " << std::string(buf, bytesReceived) << std::endl;
            }
            lastmsjRcvd = std::string(buf, bytesReceived);
            if(lastmsjRcvd == "Exito"|| lastmsjRcvd == "Error") {break;}
        }while(lastmsjRcvd!="");
        std::cout << "Sali de aqui: " << std::endl;

    }

    close(sock);
}
// Función para agregar mensajes desde las pantallas
void Socket::sendMessageToServer(const std::string& message) {
    {
        std::lock_guard<std::mutex> lock(queueMutex);
        messageQueue.push(message);
    }
    queueCondition.notify_one();
}