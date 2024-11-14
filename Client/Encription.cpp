//
// Created by yerik on 11/11/24.
//

#include "Encription.h"



std::pair<std::vector<unsigned char>, std::vector<int>> Encription::encrypt(std::string mensaje) {
    srand(static_cast<unsigned>(time(0)));
    std::vector<unsigned char> message(mensaje.begin(), mensaje.end());

    // Genera una clave AES de 16 bytes para el cifrado
    std::vector<unsigned char> aesKey(16);
    for (int i = 0; i < 16; ++i) {
        aesKey[i] = rand() % 256;
    }

    AES aes(aesKey);
    RSA rsa;

    // Cifra el mensaje con AES
    std::vector<unsigned char> encryptedMessage = aes.encrypt(message);
    std::cout << "Mensaje cifrado (AES): ";
    for (auto byte : encryptedMessage) {
        std::cout << std::hex << (int)byte ;
    }
    std::cout << std::endl;

    // Cifra cada byte de la clave AES usando RSA
    std::vector<int> encryptedKey;
    for (auto byte : aesKey) {
        encryptedKey.push_back(rsa.encrypt(byte));
    }

    // Muestra la clave AES original y la clave AES cifrada
    std::cout << "Clave AES original: ";
    for (auto byte : aesKey) {
        std::cout << std::hex << (int)byte << " ";
    }
    std::cout << std::endl;

    std::cout << "Clave AES cifrada (RSA): ";
    for (auto encryptedByte : encryptedKey) {
        std::cout << std::hex << encryptedByte << " ";
    }
    std::cout << std::endl;

    return std::make_pair(encryptedMessage, encryptedKey);
}

std::vector<unsigned char> Encription::decrypt(std::string mensaje, std::string llave) {
    // Crear un vector<unsigned char> y llenar con los caracteres de la cadena
    std::vector<unsigned char> newMensaje(mensaje.begin(), mensaje.end());
    std::vector<int> newKey;
    std::istringstream iss(llave);
    std::string token;
    while (std::getline(iss, token, ',')) {
        newKey.push_back(std::stoi(token));  // Convierte cada token a int y lo agrega al vector
    }
    RSA rsa;
    // Descifra la clave AES usando RSA
    std::vector<unsigned char> decryptedKey;
    for (auto byte : newKey) {
        decryptedKey.push_back(rsa.decrypt(byte));
    }

    std::cout << "Clave AES original: ";
    for (auto byte : decryptedKey) {
        std::cout << std::hex << (int)byte << " ";
    }
    std::cout << std::endl;


    AES aes(decryptedKey);

    // Descifra el mensaje con AES
    std::vector<unsigned char> decryptedMessage = aes.decrypt(newMensaje);

    std::string finalMsj(decryptedMessage.begin(), decryptedMessage.end());
    std::cout << finalMsj << std::endl;

    return decryptedMessage;
}