//
// Created by luis24 on 14/11/24.
//

#include "Correos.h"

Correos::Correos(const std::string& autor,const std::string& topic, const std::string& contenido, const std::string& llave)
    : autor(autor), contenido(contenido), llave(llave), topic(topic){}

std::string Correos::getAutor() const {
    return autor;
}

std::string Correos::getContenido() const {
    return contenido;
}

std::string Correos::getLlave() const {
    return llave;
}

std::string Correos::getTopic() const {
    return topic;
}

int Correos::getID() const {
    return id;
}

void Correos::setAutor(const std::string& autor) {
    this->autor = autor;
}

void Correos::setContenido(const std::string& contenido) {
    this->contenido = contenido;
}

void Correos::setLlave(const std::string& llave) {
    this->llave = llave;
}

void Correos::setTopic(const std::string& topic) {
    this->topic = topic;
}

void Correos::setId(int id) {
    this->id = id;
}
