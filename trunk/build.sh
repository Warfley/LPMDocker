#!/bin/bash

FPC=stable
LAZ=trunk

function build() {
    fpcup --noconfirm --fpcURL=$FPC --lazURL=$LAZ $@
}
function buildCross() {
    cpu="$1"
    shift
    os="$1"
    shift
    build --only=FPCBuildOnly --cputarget=$cpu --ostarget=$os $@
}

# Install fpc and lazars for linux x86_64
build
# Install cross-compiler for Win32
buildCross i386 win32
# Install cross-compiler for win64
buildCross x86_64 win64
