#!/bin/bash
make -C qemu-shoggoth
make -C qemu-shoggoth/qemu-ctrl/C
ln -fs qemu-shoggoth/qemu-img qemu-img
ln -fs qemu-shoggoth/x86_64-softmmu/qemu-system-x86_64 qemu-system-x86_64
ln -fs qemu-shoggoth/qemu-ctrl/C/racomms racomms
