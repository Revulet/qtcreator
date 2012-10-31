TEMPLATE = lib
TARGET = Todo

include(../../qtcreatorplugin.pri)
include(todo_dependencies.pri)

HEADERS += todoplugin.h \
    keyword.h \
    constants.h \
    todooutputpane.h \
    todoitem.h \
    settings.h \
    optionspage.h \
    optionsdialog.h\
    keyworddialog.h \
    todoitemsprovider.h \
    todoitemsmodel.h \
    todoitemsscanner.h \
    cpptodoitemsscanner.h \
    lineparser.h \
    todooutputtreeview.h

SOURCES += todoplugin.cpp \
    keyword.cpp \
    todooutputpane.cpp \
    optionspage.cpp \
    settings.cpp \
    optionsdialog.cpp \
    keyworddialog.cpp \
    todoitemsprovider.cpp \
    todoitemsmodel.cpp \
    todoitemsscanner.cpp \
    cpptodoitemsscanner.cpp \
    lineparser.cpp \
    todooutputtreeview.cpp

OTHER_FILES += \
    Todo.pluginspec.in

RESOURCES += \
    todoplugin.qrc

FORMS += \
    optionsdialog.ui \
    keyworddialog.ui
