TEMPLATE = lib
TARGET = ClangCodeModel

include(../../qtcreatorplugin.pri)
include(../../plugins/coreplugin/coreplugin.pri)
include(../../libs/utils/utils.pri)
include(../../plugins/cpptools/cpptools.pri)
include(../../plugins/texteditor/texteditor.pri)
include(clang_installation.pri)

message("Building with Clang from $$LLVM_INSTALL_DIR")

LIBS += $$LLVM_LIBS
INCLUDEPATH += $$LLVM_INCLUDEPATH
DEFINES += $$LLVM_DEFINES
DEFINES += CLANG_LIBRARY
DEFINES -= QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

macx: QMAKE_LFLAGS += -Wl,-rpath,\'$$LLVM_LIBDIR\'

contains(DEFINES, CLANG_COMPLETION) {
    HEADERS += clangcompletion.h clangcompleter.h
    SOURCES += clangcompletion.cpp clangcompleter.cpp
}

contains(DEFINES, CLANG_HIGHLIGHTING) {
    HEADERS += cppcreatemarkers.h clanghighlightingsupport.h
    SOURCES += cppcreatemarkers.cpp clanghighlightingsupport.cpp
}

HEADERS += clangutils.h \
    cxprettyprinter.h

SOURCES += clangutils.cpp \
    cxprettyprinter.cpp

SOURCES += \
    $$PWD/clangcodemodelplugin.cpp \
    $$PWD/sourcemarker.cpp \
    $$PWD/token.cpp \
    $$PWD/symbol.cpp \
    $$PWD/sourcelocation.cpp \
    $$PWD/unit.cpp \
    $$PWD/utils.cpp \
    $$PWD/utils_p.cpp \
    $$PWD/liveunitsmanager.cpp \
    $$PWD/index.cpp \
    $$PWD/semanticmarker.cpp \
    $$PWD/diagnostic.cpp \
    $$PWD/unsavedfiledata.cpp \
    $$PWD/clangsymbolsearcher.cpp \
    $$PWD/fastindexer.cpp \
    $$PWD/pchinfo.cpp \
    $$PWD/pchmanager.cpp \
    $$PWD/clangprojectsettings.cpp \
    $$PWD/clangprojectsettingspropertiespage.cpp

HEADERS += \
    $$PWD/clangcodemodelplugin.h \
    $$PWD/clang_global.h \
    $$PWD/sourcemarker.h \
    $$PWD/token.h \
    $$PWD/constants.h \
    $$PWD/symbol.h \
    $$PWD/cxraii.h \
    $$PWD/sourcelocation.h \
    $$PWD/unit.h \
    $$PWD/utils.h \
    $$PWD/utils_p.h \
    $$PWD/liveunitsmanager.h \
    $$PWD/index.h \
    $$PWD/semanticmarker.h \
    $$PWD/diagnostic.h \
    $$PWD/unsavedfiledata.h \
    $$PWD/clangsymbolsearcher.h \
    $$PWD/fastindexer.h \
    $$PWD/pchinfo.h \
    $$PWD/pchmanager.h \
    $$PWD/clangprojectsettings.h \
    $$PWD/clangprojectsettingspropertiespage.h

contains(DEFINES, CLANG_INDEXING) {
    HEADERS += \
        $$PWD/clangindexer.h \
        $$PWD/indexer.h
#        $$PWD/dependencygraph.h \

    SOURCES += \
        $$PWD/clangindexer.cpp \
        $$PWD/indexer.cpp
#        $$PWD/dependencygraph.cpp \

#    DEFINES+=CLANG_LEXER
}

contains(DEFINES, CLANG_LEXER) {
    HEADERS += \
        $$PWD/rawlexer.h \
        $$PWD/keywords.h \
        $$PWD/includetracker.h \
        $$PWD/codenavigator.h \
        $$PWD/unitsetup.h
    SOURCES += \
        $$PWD/rawlexer.cpp \
        $$PWD/keywords.cpp \
        $$PWD/includetracker.cpp \
        $$PWD/codenavigator.cpp \
        $$PWD/unitsetup.cpp
}

equals(TEST, 1) {
    RESOURCES += \
        $$PWD/test/clang_tests_database.qrc

    HEADERS += \
        $$PWD/test/completiontesthelper.h

    SOURCES += \
        $$PWD/test/completiontesthelper.cpp \
        $$PWD/test/clangcompletion_test.cpp

    OTHER_FILES += \
        $$PWD/test/cxx_regression_1.cpp \
        $$PWD/test/cxx_regression_2.cpp \
        $$PWD/test/cxx_regression_3.cpp \
        $$PWD/test/cxx_regression_4.cpp \
        $$PWD/test/cxx_regression_5.cpp \
        $$PWD/test/cxx_regression_6.cpp \
        $$PWD/test/cxx_regression_7.cpp \
        $$PWD/test/cxx_regression_8.cpp
}

FORMS += $$PWD/clangprojectsettingspropertiespage.ui
