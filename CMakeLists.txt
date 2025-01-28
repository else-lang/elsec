cmake_minimum_required(VERSION 3.30)

project(else
        DESCRIPTION
        "ELSE programming language"
        HOMEPAGE_URL
        "https://else-lang.com"
        LANGUAGES
        C
)

set(ELSE_VERSION_MAJOR 0)
set(ELSE_VERSION_MINOR 1)
set(ELSE_VERSION_PATCH 0)
set(ELSE_VERSION "" CACHE STRING "Override ELSE Language version string. Default is to find out with git.")

set(CMAKE_C_STANDARD 23)

add_executable(else
        src/main.c
)