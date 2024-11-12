//
// Created by yerik on 11/11/24.
//

#include <iostream>
#include "Encription.h"

int main() {
    srand(static_cast<unsigned>(time(0)));
    Encription enc;
    // Mensaje de prueba largo
    std::string longMessage = "Gabriel se la come entera";
    std::pair<std::vector<unsigned char>, std::vector<int>> result =enc.encrypt(longMessage);
    enc.decrypt(result.first, result.second);



    return 0;
}



