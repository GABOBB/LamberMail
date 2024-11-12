//
// Created by yerik on 11/8/24.
//

#ifndef REGISTER_H
#define REGISTER_H

#include <QMainWindow>

#include "ui_Register_UI.h"
#include "Socket.h"


QT_BEGIN_NAMESPACE
namespace Ui { class Register; }
QT_END_NAMESPACE

class Register : public QMainWindow {
Q_OBJECT

public:
    Socket* socket;
    explicit Register(QWidget *parent = nullptr);

Register(QWidget *parent, Socket *socket);

    ~Register() override;

void registerData();

private:
    Ui::Regiter_UI *ui;
};


#endif //REGISTER_H
