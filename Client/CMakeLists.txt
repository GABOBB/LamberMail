cmake_minimum_required(VERSION 3.10)
project(Cliente VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets Charts)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets Charts)

# Agregar todos los archivos de código fuente automáticamente, excepto los generados por CMake
file(GLOB_RECURSE SOURCE_FILES
        "${CMAKE_SOURCE_DIR}/*.cpp"
        "${CMAKE_SOURCE_DIR}/*.h"
)

# Excluir los directorios de CMake para evitar duplicaciones de 'main'
list(FILTER SOURCE_FILES EXCLUDE REGEX "/(CMakeFiles|cmake-build-debug)/")


if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(Cliente
            MANUAL_FINALIZATION
            ${SOURCE_FILES}  # Cambié PROJECT_SOURCES por SOURCE_FILES
    )
else()
    if(ANDROID)
        add_library(Cliente SHARED
                ${SOURCE_FILES}
        )
    else()
        add_executable(Cliente
                ${SOURCE_FILES}
        )
    endif()
endif()

target_link_libraries(Cliente PRIVATE Qt${QT_VERSION_MAJOR}::Widgets Qt${QT_VERSION_MAJOR}::Charts)

if(${QT_VERSION} VERSION_LESS 6.1.0)
    set(BUNDLE_ID_OPTION MACOSX_BUNDLE_GUI_IDENTIFIER com.example.Cliente)
endif()

set_target_properties(Cliente PROPERTIES
        ${BUNDLE_ID_OPTION}
        MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        MACOSX_BUNDLE TRUE
        WIN32_EXECUTABLE TRUE
)

include(GNUInstallDirs)
install(TARGETS Cliente
        BUNDLE DESTINATION ./Client
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(Cliente)
endif()
