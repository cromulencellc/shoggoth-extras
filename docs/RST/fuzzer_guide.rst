========================
Simple Dumb Fuzzer Guide
========================
Preparing your VMState
----------------------
Refer to the readme to run a VM. 

#. Determine where in your program you wish to start fuzzing. 
#. Make sure your OS handler is loaded.
#. Run your program within your shoggoth VM.
#. Find the pid of your program with the ps command
#. Set that process to be in focus with the pid command
#. Stop execution of your VM, to ensure you can set breakpoints
#. Set a breakpoint at the point you wish to begin your fuzzer job. This address can be found through either GDB, or Shoggoth's native debugging functionality.
#. Continue execution until you reach that breakpoint.
#. Run the rsavevm <StateName> command.


Below is a sample command execution:

.. code-block:: bash

        (qemu) os
        Found OS linux!
        (qemu) ps
        PID CR3     TGID    NAME
        1   3cb0f000    1       systemd
        309 38ca1000    309     dbus-daemon
        354 3b138000    354     login
        472 3a63f000    472     pwnme
        (qemu) stop
        (qemu) pid 472
        ...
        (qemu) bp 0x<55555555484c>
        Set breakpoint id 1 at address 55555555484c
        (qemu) c
        (qemu) rsavevm myState.rsave
        ...
        (qemu) q




Preparing the Fuzzer
--------------------

Simple sample python code to work from can be found in the pwnme_little_bof plugin.

The Rapid Analysis(RA) functionality of shoggoth works in a queue system, where data is communicated to and from the RA module via
predefined message classes. A simple sending job can be added in python with the code:

.. code-block:: python

    message = CommsMessage() / CommsRequestJobAddMsg(
	   queue = q,
	   job_id = jobId,
	   base_hash = hash,
	   entries = [
		  CommsRequestJobAddMemorySetup(flags="memory_virtual", size=len(sinput), offset=virtAddress, value=bytes(sinput, "UTF-8"))
	   ]
    )
    RapidAnalysis.addJob(q, message)
    
Where:
    - q is an arbitrary integer value to describe which job queue to be in
    - jobId is an arbitrary integer value to describe the job type
    - Hash is the hash value of your vmstate to load
    - virtAddress is the virtual address of an area of memory to change

The hash value of your vmstate can be found with the info.sh script in the shoggoth-extras directory.

If your program to be fuzzed requires input from stdin, you can set a breakpoint after your input then
change the value of the data at that virtual address. 

Example for a minimal buffer overflow fuzzer using the pwnme_little vmstate:

.. code-block:: python

    from pyqemu.plugin import *
    from pyqemu.messages import *
    
    tester_buf = ''
    finished = False
    
    
    #Required for plugin to load
    def on_plugin_load(*args):
        global tester_buf
        tester_buf = 'A'
    
    
    #Each time the queue is empty
    def on_ra_idle():
        global tester_buf, finished
        print('[IDLE]\n')
        #Add another 'A' to the buffer
        tester_buf = tester_buf + 'A'
    
        #Build a message to send
        message = CommsMessage() / CommsRequestJobAddMsg(
          #In job Queue 1
          queue = 1,
          #With arbitrary ID 100
          job_id = 100,
          #Send to this vmstate
          base_hash = "493c530cae5bf73435fb7fe813361c8e49568d7b",
          #A messege overwriting a section of virtual memory with our buffer
          entries = [
             CommsRequestJobAddMemorySetup(flags="memory_virtual", size=len(tester_buf), offset=0x7fffffffe550, value=bytes(tester_buf, "UTF-8"))
          ]
       )
    
        if not finished:
          message.show()
          #Add our message to queue 1
          RapidAnalysis.addJob(1, message)
    
    
    def on_exception(exception):
        global finished
        #Magic number for General Protection Fault
        if exception == 13:
            print('The program has a bad EIP!\n\n')
            finished = True

---------------------
Executing your fuzzer
---------------------
After your fuzzer is compiled and placed in your ~/.qemuplugins directory, you can invoke it with the command:

.. code-block:: bash

    ./qemu-system-x86_64 -M pc-i440fx-3.0 -ra file=<myVmstate.rsave>,notrace=on,notree=on,istep=0,nosave=on,ilimit=200000,ints=off,noblocks=on -m 2G -monitor stdio -plugin <myPlugin>

It will load your VM to the state at which you have your breakpoint, and begin fuzzing that virtual memory address, restarting each time the program ends execution.
