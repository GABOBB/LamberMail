//
// Created by yerik on 11/8/24.
//

#ifndef LOGIN_UI_H
#define LOGIN_UI_H

#include <QMainWindow>

#include "Socket.h"
#include "ui_LogIn_UI.h"
#include "Encription.h"

QT_BEGIN_NAMESPACE
namespace Ui { class LogIn; }
QT_END_NAMESPACE

class LogIn_UI : public QMainWindow {
Q_OBJECT

public:
    Socket* socket;
    explicit LogIn_UI(QWidget *parent = nullptr);
    LogIn_UI(QWidget *parent, Socket *socket);
    ~LogIn_UI() override;

void login();

private:
    Ui::MainWindow *ui;
};


#endif //LOGIN_UI_H
