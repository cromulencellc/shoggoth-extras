============
From an ISO:
============
To get an VM running in Shoggoth, two prerequisites must be met:

   - The .iso of an install disk must be available.
   - A .qcow2 file must be created to house the file system.


Creating the .qcow2
-------------------

A .qcow2 file acts as a virtual hard drive, formatted to support features from qemu.

    qemu-img create [DESIRED FILENAME].qcow2 -f qcow2 [DESIRED SIZE]

The image will be created in the working directory.

Installing the OS
-----------------

To install the desired operating system on the .qcow2 file, boot into the image file with the following command:

   ./qemu-system-x86_64 -M [ARCHITECTURE] -boot d -cdrom [IMAGE FILE] -m [DESIRED MEMORY] -hda [QCOW2 FILE]


Qemu will then be launched, and you can install your operating system as normal.
