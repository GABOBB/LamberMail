//
// Created by yerik on 11/11/24.
//

#ifndef AES_H
#define AES_H

#include <iostream>
#include <vector>

class AES {
private:
    static const int BLOCK_SIZE = 16; // Tamaño de bloque en bytes
    std::vector<unsigned char> key;
    std::vector<unsigned char> iv;

    void xorBlock(std::vector<unsigned char>& block, const std::vector<unsigned char>& iv);

public:
    AES(const std::vector<unsigned char>& key);

    const std::vector<unsigned char>& getIV() const;

    std::vector<unsigned char> encrypt(const std::vector<unsigned char>& plaintext);

    std::vector<unsigned char> decrypt(const std::vector<unsigned char>& ciphertext);
};



#endif //AES_H
