DEFINES += DOXYGEN_LIBRARY

# Doxygen files

SOURCES += doxygenplugin.cpp \
    doxygensettings.cpp \
    doxygensettingsstruct.cpp \
    doxygensettingswidget.cpp \
    doxygen.cpp \
    doxygenfilesdialog.cpp

HEADERS += doxygenplugin.h \
        doxygen_global.h \
        doxygenconstants.h \
    doxygensettings.h \
    doxygensettingsstruct.h \
    doxygensettingswidget.h \
    doxygen.h \
    doxygenfilesdialog.h

FORMS += \
    doxygensettingswidget.ui \
    doxygenfilesdialog.ui

RESOURCES += doxygen.qrc

# Qt Creator linking

## set the QTC_SOURCE variable to override the setting here
QTCREATOR_SOURCES = $$QTC_SOURCE
unix:isEmpty(QTCREATOR_SOURCES):QTCREATOR_SOURCES=$$(HOME)/Qt/Tools/QtCreator/dev/include
win32:isEmpty(QTCREATOR_SOURCES):QTCREATOR_SOURCES=C:\Qt\Tools\QtCreator\dev\include

## set the QTC_BUILD variable to override the setting here
IDE_BUILD_TREE = $$QTC_BUILD
unix:isEmpty(IDE_BUILD_TREE):IDE_BUILD_TREE=$$(HOME)/Qt/Tools/QtCreator
win32:isEmpty(IDE_BUILD_TREE):IDE_BUILD_TREE=C:\Qt\Tools\QtCreator\dev\lib\qtcreator

## set the QTC_LIB_BASENAME variable to override the setting here
## this variable points to the library installation path, relative to IDE_BUILD_TREE,
## so that $$IDE_BUILD_TREE/$$IDE_LIBRARY_BASENAME/qtcreator will be used by
## qtcreatorplugin.pri automatically as the qtcreator library path
IDE_LIBRARY_BASENAME = $$QTC_LIB_BASENAME

## uncomment to build plugin into user config directory
## <localappdata>/plugins/<ideversion>
##    where <localappdata> is e.g.
##    "%LOCALAPPDATA%\QtProject\qtcreator" on Windows Vista and later
##    "$XDG_DATA_HOME/data/QtProject/qtcreator" or "~/.local/share/data/QtProject/qtcreator" on Linux
##    "~/Library/Application Support/QtProject/Qt Creator" on Mac

#isEmpty(USE_USER_DESTDIR):USE_USER_DESTDIR=yes

###### If the plugin can be depended upon by other plugins, this code needs to be outsourced to
###### <dirname>_dependencies.pri, where <dirname> is the name of the directory containing the
###### plugin's sources.

QTC_PLUGIN_NAME = Doxygen
QTC_LIB_DEPENDS += \
    # nothing here at this time

QTC_PLUGIN_DEPENDS += \
    coreplugin \
    cpptools \
    cppeditor \
    projectexplorer \
    texteditor

QTC_PLUGIN_RECOMMENDS += \
    # optional plugin dependencies. nothing here at this time

###### End _dependencies.pri contents ######

include($$QTCREATOR_SOURCES/src/qtcreatorplugin.pri)

DEFINES -= QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

DISTFILES += \
    CMakeLists.txt \
    Doxygen.json.in

