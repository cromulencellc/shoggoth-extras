./qemu-system-x86_64 -M pc-i440fx-3.0 -ra file=pwnme_little.rsave,notrace=on,notree=on,istep=0,nosave=on,ilimit=200000,ints=off,noblocks=on -m 2G -monitor stdio -plugin pwnme_little_bof

