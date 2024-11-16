//
// Created by gabonm7 on 11/11/24.
//

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <qlistwidget.h>

#include "mail.h"
#include <QMainWindow>
#include "Socket.h"
#include "Usuario.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow {
Q_OBJECT

public:
    Socket* socket;
    Usuario* user;
    explicit MainWindow(QWidget *parent = nullptr);
    MainWindow(QWidget *parent,  Socket *socket, Usuario* user);
    ~MainWindow() override;

    void Update();

    void startUpdateThread();

    void NewMessage() ;

void manejarItemClicado(QListWidgetItem *item);

void realizarAccionConCorreo(int id);

void hideWidget();

private:
    Ui::MainWindow *ui;
};


#endif //MAINWINDOW_H
