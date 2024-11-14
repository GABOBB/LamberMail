//
// Created by yerik on 11/13/24.
//

#ifndef BASE_H
#define BASE_H

#include <mysql_driver.h>
#include <mysql_connection.h>
#include <cppconn/prepared_statement.h>
#include <cppconn/resultset.h>
#include <string>
#include <iostream>

class Base {
public:
    // Constructor que acepta los detalles de conexión y se conecta a la base de datos
    Base();

    // Destructor para liberar la conexión
    ~Base();

    // Métodos para manejar los datos de la base de datos
    bool agregarUsuario(const std::string& correo, const std::string& contrasena, const std::string& llave_encriptacion);
    void agregarCorreo(const std::string& correo_usuario, const std::string& texto, const std::string& llave_encriptacion, const std::string& correo_remitente);
    void mostrarCorreosRecibidos(const std::string& correo_usuario);

private:
    // Puntero a la conexión SQL
    sql::Connection* conn;

    // Método privado para inicializar la conexión a la base de datos
    void conectar(const std::string& host, const std::string& user, const std::string& password, const std::string& database);
};




#endif //BASE_H
