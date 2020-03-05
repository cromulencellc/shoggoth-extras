#!/bin/bash
sudo apt install python
sudo apt install python2
git submodule init
git submodule update
sudo apt install libtool-bin autoconf bison flex libpixman-1-dev zlib1g-dev libglib2.0-dev python3-dev libsdl2-dev python3-pip python3-setuptools
IMAGE_SITE="https://shoggoth-images.labs.cromulence.com/"
IMAGES=("debian9.qcow2" \
       	"pwnme_little.blocks" "pwnme_little.rsave" "pwnme_little.vmstate" \
       	"pwnme_lots.blocks" "pwnme_lots.rsave" "pwnme_lots.vmstate" \
       	"exec_me.blocks" "exec_me.rsave" "exec_me.vmstate" \
	)
for i in "${IMAGES[@]}"
do
	wget -O $i $IMAGE_SITE$i
done
cd qemu-shoggoth; ./configure --target-list="x86_64-softmmu" --enable-sdl --with-sdlabi=2.0 --enable-debug
