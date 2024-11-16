//
// Created by yerik on 11/11/24.
//

#ifndef ENCRIPTION_H
#define ENCRIPTION_H

#include <vector>
#include <ctime>
#include <cstdlib>
#include "AES.h"
#include "RSA.h"
#include <utility> // Para std::pair
#include <sstream>

class Encription {
public:
    std::pair<std::vector<unsigned char>, std::vector<int>> encrypt(std::string mensaje);
    std::string decrypt(std::string mensaje, std::string llave);

    bool compare(std::string intento, std::string llave, std::string original);
};



#endif //ENCRIPTION_H
