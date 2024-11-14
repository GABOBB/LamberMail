//
// Created by luis24 on 14/11/24.
//

#include "Usuario.h"

Usuario::Usuario(const std::string& usuario)
    : usuario(usuario) {}

std::string Usuario::getUsuario() const {
    return usuario;
}

std::vector<Correos> Usuario::getCorreos() const {
    return correos;
}

void Usuario::setUsuario(const std::string& usuario) {
    this->usuario = usuario;
}

void Usuario::addCorreo(const Correos& correo) {
    correos.push_back(correo);
}
