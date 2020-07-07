./qemu-system-x86_64 -M pc-i440fx-3.0 -ra file=exec_me.rsave,notrace=on,notree=on,istep=1,nosave=on,ilimit=20,ints=off,noblocks=on -m 2G -monitor stdio -plugin trace_exec_me
