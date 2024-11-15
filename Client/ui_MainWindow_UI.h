/********************************************************************************
** Form generated from reading UI file 'designercmIoak.ui'
**
** Created by: Qt User Interface Compiler version 5.15.13
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef DESIGNERCMIOAK_H
#define DESIGNERCMIOAK_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QListWidget>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_Correo
{
public:
    QWidget *centralwidget;
    QListWidget *listWidget;
    QPushButton *pushButton;
    QLabel *label;
    QPushButton *pushButton_2;
    QWidget *widget;
    QLabel *label_2;
    QPushButton *pushButton_3;
    QMenuBar *menubar;
    QStatusBar *statusbar;
    QToolBar *toolBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(1152, 496);
        MainWindow->setStyleSheet(QString::fromUtf8("background-color:rgb(249,240,197 )"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        listWidget = new QListWidget(centralwidget);
        listWidget->setObjectName(QString::fromUtf8("listWidget"));
        listWidget->setEnabled(true);
        listWidget->setGeometry(QRect(9, 82, 1131, 291));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(listWidget->sizePolicy().hasHeightForWidth());
        listWidget->setSizePolicy(sizePolicy);
        listWidget->setStyleSheet(QString::fromUtf8("QScrollBar:vertical {\n"
"    background: #f0f0f0;\n"
"    width: 20px;\n"
"    \n"
"}\n"
"\n"
"QListWidget::item {\n"
"	background-color:rgb(255, 255, 255);\n"
"    border-bottom: 1px solid #cccccc; /* L\303\255nea divisoria de color gris */\n"
"    padding: 4px;\n"
"}\n"
"\n"
""));
        listWidget->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOn);
        pushButton = new QPushButton(centralwidget);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));
        pushButton->setGeometry(QRect(1063, 388, 80, 34));
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(pushButton->sizePolicy().hasHeightForWidth());
        pushButton->setSizePolicy(sizePolicy1);
        QFont font;
        font.setPointSize(16);
        pushButton->setFont(font);
        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(489, 9, 173, 34));
        QFont font1;
        font1.setPointSize(20);
        label->setFont(font1);
        pushButton_2 = new QPushButton(centralwidget);
        pushButton_2->setObjectName(QString::fromUtf8("pushButton_2"));
        pushButton_2->setGeometry(QRect(9, 49, 88, 27));
        sizePolicy1.setHeightForWidth(pushButton_2->sizePolicy().hasHeightForWidth());
        pushButton_2->setSizePolicy(sizePolicy1);
        widget = new QWidget(centralwidget);
        widget->setObjectName(QString::fromUtf8("widget"));
        widget->setEnabled(false);
        widget->setGeometry(QRect(10, 80, 1131, 291));
        widget->setStyleSheet(QString::fromUtf8("background-color:rgb(255,255,255 )"));
        label_2 = new QLabel(widget);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(10, 10, 1091, 221));
        label_2->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignTop);
        pushButton_3 = new QPushButton(widget);
        pushButton_3->setObjectName(QString::fromUtf8("pushButton_3"));
        pushButton_3->setGeometry(QRect(1030, 260, 88, 27));
        MainWindow->setCentralWidget(centralwidget);
        pushButton->raise();
        label->raise();
        pushButton_2->raise();
        listWidget->raise();
        widget->raise();
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 1152, 24));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);
        toolBar = new QToolBar(MainWindow);
        toolBar->setObjectName(QString::fromUtf8("toolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, toolBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        pushButton->setText(QCoreApplication::translate("MainWindow", "+", nullptr));
        label->setText(QCoreApplication::translate("MainWindow", "LAMBER MAIL", nullptr));
        pushButton_2->setText(QCoreApplication::translate("MainWindow", "⟳", nullptr));
        label_2->setText(QString());
        pushButton_3->setText(QCoreApplication::translate("MainWindow", "Go back", nullptr));
        toolBar->setWindowTitle(QCoreApplication::translate("MainWindow", "toolBar", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_Correo {};
} // namespace Ui

QT_END_NAMESPACE

#endif // DESIGNERCMIOAK_H
