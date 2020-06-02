./qemu-system-x86_64 --drive file=debian9.qcow2,format=qcow2 -m 2G -snapshot -monitor stdio -plugin http_dataflow -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::8888-:8000
