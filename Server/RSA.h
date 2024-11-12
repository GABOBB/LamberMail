//
// Created by yerik on 11/11/24.
//

#ifndef RSA_H
#define RSA_H



class RSA {
private:
    int publicKey = 17;   // Clave pública simplificada
    int privateKey = 2753; // Clave privada simplificada
    int modulus = 3233;    // Módulo (n) simplificado

public:
    int encrypt(int data) ;

    int decrypt(int data) ;
};



#endif //RSA_H
