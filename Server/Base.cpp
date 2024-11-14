//
// Created by yerik on 11/13/24.
//

#include "Base.h"


// Constructor: inicializa la conexión a la base de datos
Base::Base() {
    std::string host = "tcp://127.0.0.1:3306";
    std::string user = "root";
    std::string password = "tu_contraseña";
    std::string database = "base_3";
    conectar(host, user, password, database);
}

// Destructor: cierra la conexión a la base de datos
Base::~Base() {
    delete conn;
}

// Método privado para conectar a la base de datos
void Base::conectar(const std::string& host, const std::string& user, const std::string& password, const std::string& database) {
    try {
        sql::mysql::MySQL_Driver *driver = sql::mysql::get_mysql_driver_instance();
        conn = driver->connect(host, user, password);
        conn->setSchema(database);
    } catch (sql::SQLException &e) {
        std::cerr << "Error al conectar a la base de datos: " << e.what() << std::endl;
        conn = nullptr;
    }
}

// Agrega un nuevo usuario a la tabla 'usuarios2'
bool Base::agregarUsuario(const std::string& correo, const std::string& contrasena, const std::string& llave_encriptacion) {
    if (!conn) return false;

    try {
        sql::PreparedStatement *pstmt = conn->prepareStatement(
            "INSERT INTO usuarios2 (correo, contrasena, llave_encriptacion) VALUES (?, ?, ?)"
        );
        pstmt->setString(1, correo);
        pstmt->setString(2, contrasena);
        pstmt->setString(3, llave_encriptacion);
        pstmt->execute();
        std::cout << "Usuario agregado exitosamente." << std::endl;
        delete pstmt;
        return true;
    } catch (sql::SQLException &e) {
        std::cerr << "Error al agregar usuario: " << e.what() << std::endl;
        return false;
    }
}

// Agrega un correo recibido para el usuario identificado por correo_usuario
void Base::agregarCorreo(const std::string& correo_usuario, const std::string& texto, const std::string& llave_encriptacion, const std::string& correo_remitente) {
    if (!conn) return;

    try {
        sql::PreparedStatement *pstmt = conn->prepareStatement(
            "SELECT id FROM usuarios2 WHERE correo = ?"
        );
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

// Muestra todos los correos recibidos para un usuario identificado por correo_usuario
void Base::mostrarCorreosRecibidos(const std::string& correo_usuario) {
    if (!conn) return;

    try {
        sql::PreparedStatement *pstmt = conn->prepareStatement(
            "SELECT id FROM usuarios2 WHERE correo = ?"
        );
        pstmt->setString(1, correo_usuario);
        sql::ResultSet *res = pstmt->executeQuery();

        if (res->next()) {
            int usuario_id = res->getInt("id");
            delete pstmt;

            pstmt = conn->prepareStatement(
                "SELECT texto, llave_encriptacion, correo_remitente, fecha FROM correos_recibidos WHERE correo_id = ?"
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

std::pair<std::string, std::string> Base::obtenerCredencialesPorCorreo(const std::string& correo) {
    std::pair<std::string, std::string> credenciales= {" "," "};  // Para almacenar la contraseña y la clave
    if (!conn) return credenciales;

    try {

        sql::PreparedStatement *pstmt = conn->prepareStatement(
            "SELECT contrasena, llave_encriptacion FROM usuarios2 WHERE correo = ?"
        );

        pstmt->setString(1, correo);
        sql::ResultSet *res = pstmt->executeQuery();
        bool found = false;

        while (res->next()) {
            std::cout << "Contraseña: " << res->getString("contrasena") << std::endl;
            std::cout << "Llave de Encriptación: " << res->getString("llave_encriptacion") << std::endl;
            std::cout << "-----------------------------" << std::endl;
            credenciales.first = res->getString("contrasena");  // Obtiene la contraseña
            credenciales.second = res->getString("llave_encriptacion");      // Obtiene la clave
            found = true;
        }
        if (!found) {
            std::cout << "Usuario no encontrado con el correo especificado." << std::endl;
        }

    } catch (sql::SQLException &e) {
        std::cerr << "Error al mostrar correos recibidos: " << e.what() << std::endl;
    }

    return credenciales;
}
