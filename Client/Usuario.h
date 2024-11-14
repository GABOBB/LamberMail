//
// Created by luis24 on 14/11/24.
//

#ifndef USUARIO_H
#define USUARIO_H

#include <string>
#include <vector>
#include "Correos.h"

class Usuario {
public:
    Usuario(const std::string& usuario);

    std::string getUsuario() const;
    std::vector<Correos> getCorreos() const;

    void setUsuario(const std::string& usuario);
    void addCorreo(const Correos& correo);

private:
    std::string usuario;
    std::vector<Correos> correos;
};

#endif // USUARIO_H