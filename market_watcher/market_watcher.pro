QT += core dbus xml
QT -= gui

TARGET = market_watcher
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

INCLUDEPATH = ../common

SOURCES += main.cpp \
    tick_receiver.cpp \
    market_watcher.cpp \
    ../common/market.cpp \
    ../common/utility.cpp

HEADERS += \
    market_watcher.h \
    tick_receiver.h \
    ../common/market.h \
    ../common/utility.h

INCLUDEPATH += ../common/
DBUS_ADAPTORS += ../interface/market_watcher.xml

DISTFILES +=

unix {
    HEADERS += \
        ../ctp/linux64/ThostFtdcMdApi.h \
        ../ctp/linux64/ThostFtdcUserApiDataType.h \
        ../ctp/linux64/ThostFtdcUserApiStruct.h

    INCLUDEPATH += ../ctp/linux64/
    LIBS += ../ctp/linux64/thostmduserapi.so
    QMAKE_CXXFLAGS += -std=c++11
}

win32 {
    HEADERS += \
        ../ctp/win32/ThostFtdcMdApi.h \
        ../ctp/win32/ThostFtdcUserApiDataType.h \
        ../ctp/win32/ThostFtdcUserApiStruct.h

    INCLUDEPATH += ../ctp/win32/
    LIBS += ../ctp/win32/thostmduserapi.lib
}
