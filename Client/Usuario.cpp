//
// Created by luis24 on 14/11/24.
//

#include "Usuario.h"

Usuario::Usuario(const std::string& usuario)
    : usuario(usuario), totalCorreos(0) {}

std::string Usuario::getUsuario() const {
    return usuario;
}

std::vector<Correos> Usuario::getCorreos() const {
    return correos;
}

int Usuario::getTotalCorreos() const {
    return totalCorreos;
}

void Usuario::setUsuario(const std::string& usuario) {
    this->usuario = usuario;
}

void Usuario::addCorreo( Correos& correo) {
    correo.setId(totalCorreos);
    correos.push_back(correo);
    totalCorreos+=1;
}

void Usuario::refreshMail() {
    correos.clear();
    totalCorreos=0;
}
