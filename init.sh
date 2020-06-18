#!/bin/bash
git submodule init
git submodule update
sudo apt install libtool-bin autoconf bison flex libpixman-1-dev zlib1g-dev libglib2.0-dev python3-dev libsdl2-dev python3-pip python3-setuptools qtdeclarative5-dev
./download.sh
cd qemu-shoggoth; ./configure --target-list="x86_64-softmmu" --enable-sdl --enable-debug
