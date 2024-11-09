//
// Created by yerik on 11/8/24.
//

#ifndef LOGIN_UI_H
#define LOGIN_UI_H

#include <QMainWindow>
#include "ui_LogIn_UI.h"

QT_BEGIN_NAMESPACE
namespace Ui { class LogIn; }
QT_END_NAMESPACE

class LogIn_UI : public QMainWindow {
Q_OBJECT

public:
    explicit LogIn_UI(QWidget *parent = nullptr);
    ~LogIn_UI() override;

private:
    Ui::MainWindow *ui;
};


#endif //LOGIN_UI_H
