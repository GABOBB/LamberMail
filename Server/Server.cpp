//
// Created by yerik on 11/13/24.
//

#include "Server.h"

Server::Server() : listening(-1), max_fd(-1) {
    FD_ZERO(&master_set);
    startServer();

}

Server::~Server() {
    if (listening != -1) {
        close(listening);
    }
}

int Server::startServer() {
    listening = socket(AF_INET, SOCK_STREAM, 0);

    sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_port = htons(54000);
    inet_pton(AF_INET, "127.0.0.1", &address.sin_addr);

    if (bind(listening, (struct sockaddr*)&address, sizeof(address)) == -1) {
        std::cerr << "Bind fail" << std::endl;
        return -2;
    }

    if (listen(listening, SOMAXCONN) == -1) {
        std::cerr << "Listen fail" << std::endl;
        return -3;
    }

    std::cout << "Servidor escuchando en 127.0.0.1:54000" << std::endl;

    FD_SET(listening, &master_set);
    max_fd = listening;

    while (true) {
        fd_set copy_set = master_set;

        int socket_count = select(max_fd + 1, &copy_set, nullptr, nullptr, nullptr);
        if (socket_count == -1) {
            std::cerr << "Select fail" << std::endl;
            break;
        }

        for (int i = 0; i <= max_fd; i++) {
            if (FD_ISSET(i, &copy_set)) {
                if (i == listening) {
                    sockaddr_in client;
                    socklen_t clientSize = sizeof(client);
                    int client_socket = accept(listening, (struct sockaddr*)&client, &clientSize);

                    if (client_socket == -1) {
                        std::cerr << "Accept fail" << std::endl;
                        continue;
                    }

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
                        std::cout << host << " conectado en el puerto: " << svc << std::endl;
                    } else {
                        inet_ntop(AF_INET, &client.sin_addr, host, NI_MAXHOST);
                        std::cout << host << " conectado en el puerto: " << ntohs(client.sin_port) << std::endl;
                    }
                } else {
                    char buf[262144];
                    memset(buf, 0, 262144);
                    int bytesR = recv(i, buf, 262144, 0);

                    if (bytesR <= 0) {
                        if (bytesR == 0) {
                            std::cout << "El cliente se desconectó" << std::endl;
                        } else {
                            std::cerr << "Recv fail" << std::endl;
                        }
                        close(i);
                        FD_CLR(i, &master_set);
                    } else {
                        std::string data(buf, bytesR);
                        std::cout << "Recibido " << bytesR << " bytes: ";
                        for (int j = 0; j < bytesR - 1; j++) {
                            std::cout << buf[j];
                        }
                        std::cout << std::endl;
                        // Procesar el primer carácter del mensaje
                        char command = buf[0];
                        int caso=1;
                        int k=0;
                        int l=0;
                        int m=0;
                        char user[262144]={};
                        char password[262144]={};
                        char key[262144]={};
                        char user2[262144]={};
                        std::string mensaje="";
                        std::pair<std::string,std::string> login={"",""};
                        std::vector<std::tuple<std::string,std::string,std::string>> mails = {};
                        switch (command) {
                            case 'R':
                                for (int j = 2; j < bytesR-1; j++) {
                                    if (caso==1) {
                                        if(buf[j]==':') {
                                            if(buf[j+1]!=':') {
                                                caso=2;
                                            }else {
                                                user[j-2] = buf[j];
                                            }
                                        }else {
                                            user[j-2] = buf[j];
                                        }

                                    }else if(caso==2) {

                                        if(buf[j]==':') {
                                            if(buf[j+1]!=':') {
                                                caso=3;
                                            }else {
                                                password[k] = buf[j];
                                                k++;
                                            }
                                        }else {
                                            password[k] = buf[j];
                                            k++;
                                        }

                                    }else if(caso==3) {
                                        key[l] = buf[j];
                                        l++;

                                    }
                                }
                                for (size_t i = 0; i < k-1; ++i) {
                                    mensaje += password[i];  // Añade cada carácter al string
                                }
                                if(base.agregarUsuario(user, password,key)) {
                                    send(i, "Exito", 5, 0);
                                }else {
                                    send(i, "Error", 5, 0);
                                }
                            // Agregar el código para manejar el comando 'R'
                            break;
                            case 'L':
                                for (int j = 2; j < bytesR-1; j++) {
                                    if (caso==1) {
                                        user[j-2]=buf[j];
                                    }
                                }
                                login = base.obtenerCredencialesPorCorreo(user);
                                mensaje= login.first+":"+login.second;
                                send(i, mensaje.c_str(), mensaje.size(), 0);
                                std::this_thread::sleep_for(std::chrono::milliseconds(100));
                                send(i, "Exito", 5, 0);

                            // Agregar el código para manejar el comando 'L'
                            break;
                            case 'U':
                                for (int j = 2; j < bytesR-1; j++) {
                                    if (caso==1) {
                                        user[j-2]=buf[j];
                                    }
                                }
                                mails=base.mostrarCorreosRecibidos(user);
                                if (!mails.empty()) {
                                    for (auto item : mails) {
                                        auto [text, key, autor] = item;
                                        mensaje += text+":"+key+":"+autor;
                                        send(i, mensaje.c_str(), mensaje.size(), 0);
                                        mensaje="";
                                        std::this_thread::sleep_for(std::chrono::milliseconds(100));
                                    }
                                    send(i, "Exito", 5, 0);
                                }else {
                                    send(i, "Error", 5, 0);
                                }

                            // Agregar el código para manejar el comando 'U'
                            break;
                            case 'S':
                                for (int j = 2; j < bytesR-1; j++) {
                                    if (caso==1) {
                                        if(buf[j]==':') {
                                            if(buf[j+1]!=':') {
                                                caso=2;
                                            }else {
                                                user[j-2] = buf[j];
                                            }
                                        }else {
                                            user[j-2] = buf[j];
                                        }

                                    }else if(caso==2) {

                                        if(buf[j]==':') {
                                            if(buf[j+1]!=':') {
                                                caso=3;
                                            }else {
                                                password[k] = buf[j];
                                                k++;
                                            }
                                        }else {
                                            password[k] = buf[j];
                                            k++;
                                        }

                                    }else if(caso==3) {
                                        if(buf[j]==':') {
                                            if(buf[j+1]!=':') {
                                                caso=4;
                                            }else {
                                                key[l] = buf[j];
                                                l++;
                                            }
                                        }else {
                                            key[l] = buf[j];
                                            l++;
                                        }
                                    }else if (caso==4) {
                                        user2[m] = buf[j];
                                        m++;
                                    }
                                }
                                for (size_t i = 0; i < k-1; ++i) {
                                    mensaje += password[i];  // Añade cada carácter al string
                                }
                                if(base.agregarCorreo(user, password,key,user2)) {
                                    send(i, "Exito", 5, 0);
                                }else {
                                    send(i, "Error", 5, 0);
                                }


                            // Agregar el código para manejar el comando 'U'
                            break;
                            default:
                                std::cout << "Comando desconocido recibido: " << command << std::endl;
                                send(i, buf, bytesR-2, 0);
                            break;
                        }




                    }
                }
            }
        }
    }
    return 0;
}
