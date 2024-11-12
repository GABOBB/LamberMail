//
// Created by yerik on 11/11/24.
//

#include "RSA.h"

int RSA::encrypt(int data) {
    int encrypted = 1;
    for (int i = 0; i < publicKey; ++i) {
        encrypted = (encrypted * data) % modulus;
    }
    return encrypted;
}

int RSA::decrypt(int data) {
    int decrypted = 1;
    for (int i = 0; i < privateKey; ++i) {
        decrypted = (decrypted * data) % modulus;
    }
    return decrypted;
}