//
// Created by luis24 on 14/11/24.
//

#ifndef CORREOS_H
#define CORREOS_H

#include <string>

class Correos {
public:
    Correos(const std::string& autor, const std::string& contenido, const std::string& llave);

    std::string getAutor() const;
    std::string getContenido() const;
    std::string getLlave() const;

    void setAutor(const std::string& autor);
    void setContenido(const std::string& contenido);
    void setLlave(const std::string& llave);

private:
    std::string autor;
    std::string contenido;
    std::string llave;
};

#endif // CORREOS_H