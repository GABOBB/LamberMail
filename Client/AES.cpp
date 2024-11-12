//
// Created by yerik on 11/11/24.
//

#include "AES.h"

AES::AES(const std::vector<unsigned char>& key) : key(key) {
    iv.resize(BLOCK_SIZE);
    for (int i = 0; i < BLOCK_SIZE; ++i) {
        iv[i] = i;
    }
}

void AES::xorBlock(std::vector<unsigned char>& block, const std::vector<unsigned char>& iv) {
    for (int i = 0; i < BLOCK_SIZE; ++i) {
        block[i] ^= iv[i];
    }
}

const std::vector<unsigned char>& AES::getIV() const { return iv; }

std::vector<unsigned char> AES::encrypt(const std::vector<unsigned char>& plaintext) {
    std::vector<unsigned char> ciphertext;
    std::vector<unsigned char> currentIV = iv;
    bool resized = false;

    for (size_t i = 0; i < plaintext.size(); i += BLOCK_SIZE) {

        std::vector<unsigned char> block;
        for (int k = i; k < i+BLOCK_SIZE; ++k) {
            if (k>= plaintext.size()) {
                unsigned char c = 0;
                block.push_back(c);
            }else {
                block.push_back(plaintext[k]);
            }

        }

        xorBlock(block, currentIV); // XOR con IV
        // Simula la encriptación AES, aquí solo hacemos un XOR con la clave para fines de ejemplo
        for (int j = 0; j < BLOCK_SIZE; ++j) {
            block[j] ^= key[j];
        }
        ciphertext.insert(ciphertext.end(), block.begin(), block.end());
        currentIV = block; // Actualizar IV para CBC
    }
    return ciphertext;
}

std::vector<unsigned char> AES::decrypt(const std::vector<unsigned char>& ciphertext) {
    std::vector<unsigned char> plaintext;
    std::vector<unsigned char> currentIV = iv;

    for (size_t i = 0; i < ciphertext.size(); i += BLOCK_SIZE) {
        std::vector<unsigned char> block(ciphertext.begin() + i, ciphertext.begin() + i + BLOCK_SIZE);
        std::vector<unsigned char> decryptedBlock = block;

        // Simula la desencriptación AES
        for (int j = 0; j < BLOCK_SIZE; ++j) {
            decryptedBlock[j] ^= key[j];
        }

        xorBlock(decryptedBlock, currentIV); // XOR con IV para CBC
        plaintext.insert(plaintext.end(), decryptedBlock.begin(), decryptedBlock.end());
        currentIV = block; // Actualizar IV
    }
    return plaintext;
}