#!/bin/bash

FPC=stable
LAZ=stable

source ../build_funcs.sh

# Install fpc and lazars for linux x86_64
build
# Install cross-compiler for Win32
buildCross i386 win32
# Install cross-compiler for win64
buildCross x86_64 win64
# Cleaning up for slim images
buildCleanup