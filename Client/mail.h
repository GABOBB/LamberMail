//
// Created by gabonm7 on 13/11/24.
//

#ifndef MAIL_H
#define MAIL_H

#include <QMainWindow>
#include "ui_Mail_UI.h"
#include "Socket.h"
#include "Usuario.h"
#include "Encription.h"


QT_BEGIN_NAMESPACE
namespace Ui { class mail; }
QT_END_NAMESPACE

class mail : public QMainWindow {
Q_OBJECT

public:
    Socket* socket;
    Usuario* user;
    explicit mail(QWidget *parent = nullptr);
    mail(QWidget *parent,  Socket *socket, Usuario* user);
    ~mail() override;

void send();

private:
    Ui::mail *ui;
};


#endif //MAIL_H
