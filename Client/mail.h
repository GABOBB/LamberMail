//
// Created by gabonm7 on 13/11/24.
//

#ifndef MAIL_H
#define MAIL_H

#include <QMainWindow>
#include "ui_Mail_UI.h"


QT_BEGIN_NAMESPACE
namespace Ui { class mail; }
QT_END_NAMESPACE

class mail : public QMainWindow {
Q_OBJECT

public:
    explicit mail(QWidget *parent = nullptr);
    ~mail() override;

private:
    Ui::mail *ui;
};


#endif //MAIL_H
