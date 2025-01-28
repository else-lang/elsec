# install locations
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin

# variables used during build
PLATFORM = linux
ARCH = x86_64
CFLAGS = -g -std=c23 -Wall -Werror -Wextra -pedantic \
 	-D_XOPEN_SOURCE=800 -Iinclude -Wno-unused-parameter
LDFLAGS =
LIBS = -lm

# commands used by the build script
CC = cc
GCC = gcc
CLANG = clang
AS = as
LD = ld

# build locations
CACHE = .cache
BINOUT = .bin

# variables that will be embedded in the binary with -D definitions
DEFAULT_TARGET = $(ARCH)
VERSION = $$(./scripts/version)