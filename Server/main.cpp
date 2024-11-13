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

/**using namespace std;

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
}**/

#include <mysql_driver.h>
#include <mysql_connection.h>
#include <cppconn/prepared_statement.h>
#include <cppconn/resultset.h>
#include <iostream>

void agregarUsuario(sql::Connection *conn, const std::string &correo, const std::string &contrasena, const std::string &llave_encriptacion) {
    try {
        sql::PreparedStatement *pstmt;
        pstmt = conn->prepareStatement("INSERT INTO usuarios2 (correo, contrasena, llave_encriptacion) VALUES (?, ?, ?)");
        pstmt->setString(1, correo);
        pstmt->setString(2, contrasena);
        pstmt->setString(3, llave_encriptacion);
        pstmt->execute();
        std::cout << "Usuario agregado exitosamente." << std::endl;
        delete pstmt;
    } catch (sql::SQLException &e) {
        std::cerr << "Error al agregar usuario: " << e.what() << std::endl;
    }
}

void agregarCorreo(sql::Connection *conn, const std::string &correo_usuario, const std::string &texto, const std::string &llave_encriptacion, const std::string &correo_remitente) {
    try {
        sql::PreparedStatement *pstmt = conn->prepareStatement("SELECT id FROM usuarios2 WHERE correo = ?");
        pstmt->setString(1, correo_usuario);

        sql::ResultSet *res = pstmt->executeQuery();

        if (res->next()) {
            int usuario_id = res->getInt("id");

            delete pstmt;
            pstmt = conn->prepareStatement(
                "INSERT INTO correos_recibidos (correo_id, texto, llave_encriptacion, correo_remitente) VALUES (?, ?, ?, ?)"
            );
            pstmt->setInt(1, usuario_id);
            pstmt->setString(2, texto);
            pstmt->setString(3, llave_encriptacion);
            pstmt->setString(4, correo_remitente);
            pstmt->execute();
            std::cout << "Correo agregado exitosamente." << std::endl;
        } else {
            std::cout << "Usuario no encontrado con el correo especificado." << std::endl;
        }

        delete res;
        delete pstmt;

    } catch (sql::SQLException &e) {
        std::cerr << "Error al agregar correo: " << e.what() << std::endl;
    }
}

void mostrarCorreosRecibidos(sql::Connection *conn, const std::string &correo_usuario) {
    try {
        sql::PreparedStatement *pstmt = conn->prepareStatement("SELECT id FROM usuarios2 WHERE correo = ?");
        pstmt->setString(1, correo_usuario);

        sql::ResultSet *res = pstmt->executeQuery();

        if (res->next()) {
            int usuario_id = res->getInt("id");
            delete pstmt;

            // Consultar correos recibidos usando el id del usuario
            pstmt = conn->prepareStatement(
                "SELECT texto, llave_encriptacion, correo_remitente, fecha "
                "FROM correos_recibidos WHERE correo_id = ?"
            );
            pstmt->setInt(1, usuario_id);

            sql::ResultSet *correosRes = pstmt->executeQuery();
            std::cout << "Correos recibidos para " << correo_usuario << ":" << std::endl;

            while (correosRes->next()) {
                std::cout << "Texto: " << correosRes->getString("texto") << std::endl;
                std::cout << "Llave de Encriptación: " << correosRes->getString("llave_encriptacion") << std::endl;
                std::cout << "Correo Remitente: " << correosRes->getString("correo_remitente") << std::endl;
                std::cout << "Fecha: " << correosRes->getString("fecha") << std::endl;
                std::cout << "-----------------------------" << std::endl;
            }

            delete correosRes;
        } else {
            std::cout << "Usuario no encontrado con el correo especificado." << std::endl;
        }

        delete res;
        delete pstmt;

    } catch (sql::SQLException &e) {
        std::cerr << "Error al mostrar correos recibidos: " << e.what() << std::endl;
    }
}

int main() {
    try {
        sql::mysql::MySQL_Driver *driver;
        sql::Connection *conn;

        // Conectar al servidor MySQL
        driver = sql::mysql::get_mysql_driver_instance();
        conn = driver->connect("tcp://127.0.0.1:3306", "usuario", "contraseña");

        // Seleccionar la base de datos
        conn->setSchema("base_3");

        // Ejemplo de agregar un usuario nuevo
        std::string nuevoCorreo = "nuevo_usuario@dominio.com";
        std::string nuevaContrasena = "nueva_contrasena_encriptada";
        std::string nuevaLlaveEncriptacion = "llave_encriptacion_nueva";
        agregarUsuario(conn, nuevoCorreo, nuevaContrasena, nuevaLlaveEncriptacion);

        // Ejemplo de agregar un correo para el usuario identificado por su correo
        std::string correo_usuario = "nuevo_usuario@dominio.com";  // Buscar usuario por correo
        std::string textoCorreo = "Este es un mensaje nuevo";
        std::string llaveEncriptacionCorreo = "llave_encriptacion_mensaje";
        std::string correoRemitente = "remitente@dominio.com";
        agregarCorreo(conn, correo_usuario, textoCorreo, llaveEncriptacionCorreo, correoRemitente);

        // Mostrar correos recibidos para un usuario
        mostrarCorreosRecibidos(conn, correo_usuario);

        delete conn;

    } catch (sql::SQLException &e) {
        std::cerr << "Error: " << e.what() << std::endl;
    }

    return 0;
}

