//
// Created by yerik on 11/8/24.
//

#ifndef REGISTER_H
#define REGISTER_H

#include <QMainWindow>

#include "LogIn.h"
#include "ui_Register_UI.h"
#include "Socket.h"
#include "Encription.h"
#include "Usuario.h"


QT_BEGIN_NAMESPACE
namespace Ui { class Register; }
QT_END_NAMESPACE

class Register : public QMainWindow {
Q_OBJECT

public:
    Socket* socket;
    Usuario* usuario;
    bool isPasswordMode = true;
    explicit Register(QWidget *parent = nullptr);

    Register(QWidget *parent, Socket *socket, Usuario* usuario);

    ~Register() override;

void registerData();

void closeWindow();

void toggle();

private:
    Ui::Regiter_UI *ui;
};


#endif //REGISTER_H
