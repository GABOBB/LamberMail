//
// Servidor con soporte para múltiples clientes usando select()
//

#include <iostream>
#include <sys/socket.h>
#include <netdb.h>
#include <cstring>
#include <string>
#include <unistd.h>
#include <arpa/inet.h>
#include <vector>

using namespace std;

int main(int argc, char *argv[]) {
    int listening = socket(AF_INET, SOCK_STREAM, 0);
    if (listening == -1) {
        cerr << "Socket fail" << endl;
        return -1;
    }

    sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_port = htons(54000);
    inet_pton(AF_INET, "127.0.0.1", &address.sin_addr);

    if (bind(listening, (struct sockaddr*)&address, sizeof(address)) == -1) {
        cerr << "Bind fail" << endl;
        return -2;
    }

    if (listen(listening, SOMAXCONN) == -1) {
        cerr << "Listen fail" << endl;
        return -3;
    }

    cout << "Servidor escuchando en 127.0.0.1:54000" << endl;

    // Conjuntos de descriptores de archivo para select()
    fd_set master_set;
    FD_ZERO(&master_set);
    FD_SET(listening, &master_set);
    int max_fd = listening;

    while (true) {
        fd_set copy_set = master_set;

        // Usar select para monitorear sockets
        int socket_count = select(max_fd + 1, &copy_set, nullptr, nullptr, nullptr);
        if (socket_count == -1) {
            cerr << "Select fail" << endl;
            break;
        }

        // Revisar cada socket en el conjunto
        for (int i = 0; i <= max_fd; i++) {
            if (FD_ISSET(i, &copy_set)) {
                // Nueva conexión entrante
                if (i == listening) {
                    sockaddr_in client;
                    socklen_t clientSize = sizeof(client);
                    int client_socket = accept(listening, (struct sockaddr*)&client, &clientSize);

                    if (client_socket == -1) {
                        cerr << "Accept fail" << endl;
                        continue;
                    }

                    // Añadir nuevo cliente al conjunto maestro
                    FD_SET(client_socket, &master_set);
                    if (client_socket > max_fd) {
                        max_fd = client_socket;
                    }

                    char host[NI_MAXHOST];
                    char svc[NI_MAXSERV];
                    memset(host, 0, NI_MAXHOST);
                    memset(svc, 0, NI_MAXSERV);

                    int result = getnameinfo((struct sockaddr*)&client, sizeof(client), host, NI_MAXHOST, svc, NI_MAXSERV, 0);

                    if (result) {
                        cout << host << " conectado en el puerto: " << svc << endl;
                    } else {
                        inet_ntop(AF_INET, &client.sin_addr, host, NI_MAXHOST);
                        cout << host << " conectado en el puerto: " << ntohs(client.sin_port) << endl;
                    }
                } else {
                    // Datos recibidos de un cliente existente
                    char buf[4096];
                    memset(buf, 0, 4096);
                    int bytesR = recv(i, buf, 4096, 0);

                    if (bytesR <= 0) {
                        // Error o cliente desconectado
                        if (bytesR == 0) {
                            cout << "El cliente se desconectó" << endl;
                        } else {
                            cerr << "Recv fail" << endl;
                        }
                        close(i);
                        FD_CLR(i, &master_set);
                    } else {
                        // Imprimir datos recibidos
                        std::string data(buf, bytesR);
                        cout << "Recibido " << bytesR << " bytes: ";
                        for (int j=0; j<bytesR-1; j++) {
                            std::cout << buf[j];
                        }
                        std::cout << endl;

                        // Enviar datos de vuelta al cliente
                        send(i, buf, bytesR, 0);
                    }
                }
            }
        }
    }

    close(listening);
    return 0;
}
