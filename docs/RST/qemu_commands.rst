#Documentation

A
-

acl_add
~~~~~~~

acl_add aclname match allow|deny [index] – add a match rule to the
access control list

acl_policy
~~~~~~~~~~

acl_policy aclname allow|deny – set default access control list policy

acl_remove
~~~~~~~~~~

acl_remove aclname match – remove a match rule from the access control
list

acl_reset
~~~~~~~~~

acl_reset aclname – reset the access control list

acl_show
~~~~~~~~

acl_show aclname – list rules in the access control list

announce_self
~~~~~~~~~~~~~

announce_self – Trigger GARP/RARP announcements

B
-

balloon_target
~~~~~~~~~~~~~~

balloon target – request VM to change its memory allocation (in MB)

block_job_cancel
~~~~~~~~~~~~~~~~

block_job_cancel [-f] device – stop an active background block operation
(use -f if you want to abort the operation immediately instead of keep
running until data is in sync)

block_job_complete
~~~~~~~~~~~~~~~~~~

block_job_complete device – stop an active background block operation

block_job_pause
~~~~~~~~~~~~~~~

block_job_pause device – pause an active background block operation

block_job_resume
~~~~~~~~~~~~~~~~

block_job_resume device – resume a paused background block operation

block_job_set_speed
~~~~~~~~~~~~~~~~~~~

block_job_set_speed device speed – set maximum speed for a background
block operation

block_passwd
~~~~~~~~~~~~

block_passwd block_passwd device password – set the password of
encrypted block devices

block_resize
~~~~~~~~~~~~

block_resize device size – resize a block image

block_set_io_throttle
~~~~~~~~~~~~~~~~~~~~~

block_set_io_throttle device bps bps_rd bps_wr iops iops_rd iops_wr –
change I/O throttle limits for a block drive

block_stream
~~~~~~~~~~~~

block_stream device [speed [base]] – copy data from a backing file into
a block device

boot_set
~~~~~~~~

boot_set bootdevice – define new values for the boot device list

bp
~~

bp address –

bphw
~~~~

bphw address –

bplist
~~~~~~

bplist –

C
-

change
~~~~~~

change device filename [format [read-only-mode]] – change a removable
medium, optional format

chardev-add
~~~~~~~~~~~

chardev-add args – add chardev

chardev-change
~~~~~~~~~~~~~~

chardev-change id args – change chardev

chardev-remove
~~~~~~~~~~~~~~

chardev-remove id – remove chardev

chardev-send-break
~~~~~~~~~~~~~~~~~~

chardev-send-break id – send a break on chardev

client_migrate_info
~~~~~~~~~~~~~~~~~~~

client_migrate_info protocol hostname port tls-port cert-subject – set
migration information for remote display

closefd
~~~~~~~

closefd closefd name – close a file descriptor previously passed via SCM
rights

commit
~~~~~~

commit device|all – commit changes to the disk images (if -snapshot is
used) or backing files

cpu
~~~

cpu index – set the default CPU

cpu-add
~~~~~~~

cpu-add id – add cpu (deprecated, use device_add instead)

cont
~~~~

c|cont – resume emulation

D
-

debug
~~~~~

debug (null) –

delvm
~~~~~

delvm tag – delete a VM snapshot from its tag

device_add
~~~~~~~~~~

device_add driver[,prop=value][,…] – add device, like -device on the
command line

device_del
~~~~~~~~~~

device_del device – remove device

drive_add
~~~~~~~~~

drive_add – add drive to PCI storage controller

Options:

``[-n]`` ``[[<domain>:]<bus>:]<slot>`` ``[file=file]`` ``[,if=type]``
``[,bus=n]`` ``[,unit=m]`` ``[,media=d]`` ``[,index=i]``
``[,snapshot=on|off[,cache=on|off]`` ``[,readonly=on|off]``
``[,copy-on-read=on|off]``

drive_backup
~~~~~~~~~~~~

drive_backup [-n] [-f] [-c] device target [format] – initiates a
point-in-time copy for a device. The device’s contents are copied to the
new image file, excluding data that is written after the command is
started. The -n flag requests QEMU to reuse the image found in
new-image-file, instead of recreating it from scratch. The -f flag
requests QEMU to copy the whole disk, so that the result does not need a
backing file. The -c flag requests QEMU to compress backup data (if the
target format supports it).

drive_del
~~~~~~~~~

drive_del device – remove host block device

drive_mirror
~~~~~~~~~~~~

drive_mirror [-n] [-f] device target [format] – initiates live storage
migration for a device. The device’s contents are copied to the new
image file, including data that is written after the command is started.
The -n flag requests QEMU to reuse the image found in new-image-file,
instead of recreating it from scratch. The -f flag requests QEMU to copy
the whole disk, so that the result does not need a backing file.

dump-guest-memory
~~~~~~~~~~~~~~~~~

| dump-guest-memory [-p] [-d] [-z|-l|-s|-w] filename [begin length] –
  dump guest memory into file ‘filename’.
| ``-p: do paging to get guest's memory mapping.``
| ``-d: return immediately (do not wait for completion).``
| ``-z: dump in kdump-compressed format, with zlib compression.``
| ``-l: dump in kdump-compressed format, with lzo compression.``
| ``-s: dump in kdump-compressed format, with snappy compression.``
| ``-w: dump in Windows crashdump format (can be used instead of ELF-dump converting), for Windows x64 guests with vmcoreinfo driver only.``
| ``begin: the starting physical address.``
| ``length: the memory size, in bytes.``

E
-

eject
~~~~~

eject [-f] device – eject a removable medium (use -f to force it)

exec
~~~~

exec – directly execute a plugin command

exit_preconfig
~~~~~~~~~~~~~~

exit_preconfig – exit the preconfig state

expire_password
~~~~~~~~~~~~~~~

expire_password protocol time – set spice/vnc password expire-time

G
-

gdbserver
~~~~~~~~~

gdbserver [device] – start gdbserver on given device (default
‘tcp::1234’), stop with ‘none’

getfd
~~~~~

getfd getfd name – receive a file descriptor via SCM rights and assign
it a name

gpa2hpa
~~~~~~~

gpa2hpa addr – print the host physical address corresponding to a guest
physical address

gpa2hva
~~~~~~~

gpa2hva addr – print the host virtual address corresponding to a guest
physical address

H
-

help
~~~~

help|? [cmd] – show the help

hostfwd_add
~~~~~~~~~~~

hostfwd_add [hub_id name]|[netdev_id]
[tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport – redirect TCP or
UDP connections from host to guest (requires -net user)

hostfwd_remove
~~~~~~~~~~~~~~

hostfwd_remove [hub_id name]|[netdev_id] [tcp|udp]:[hostaddr]:hostport –
remove host-to-guest TCP or UDP redirection i /fmt addr – I/O port read

I
-

info
~~~~

info [subcommand] – show various information about the system state

L
-

loadvm
~~~~~~

loadvm tag – restore a VM snapshot from its tag

log
~~~

log item1[,…] – activate logging of the specified items

logfile
~~~~~~~

logfile filename – output logs to ‘filename’

M
-

maps
~~~~

maps (null) –

mce
~~~

mce [-b] cpu bank status mcgstatus addr misc – inject a MCE on the given
CPU [and broadcast to other CPUs with -b option]

memsave
~~~~~~~

memsave addr size file – save to disk virtual memory dump starting at
‘addr’ of size ‘size’

migrate
~~~~~~~

| migrate [-d] [-b] [-i] [-r] uri – migrate to URI (using -d to not wait
  for completion)
| -b for migration without shared storage with full copy of disk
| -i for migration without shared storage with incremental copy of disk
  (base image shared between src and destination)
| -r to resume a paused migration

migrate_cancel
~~~~~~~~~~~~~~

migrate_cancel – cancel the current VM migration

migrate_continue
~~~~~~~~~~~~~~~~

migrate_continue state – Continue migration from the given paused state

migrate_incoming_url
~~~~~~~~~~~~~~~~~~~~

migrate_incoming uri – Continue an incoming migration from an -incoming
defer

migrate_pause
~~~~~~~~~~~~~

migrate_pause – Pause an ongoing migration (postcopy-only)

migrate_recover
~~~~~~~~~~~~~~~

migrate_recover uri – Continue a paused incoming postcopy migration

migrate_set_cache_size
~~~~~~~~~~~~~~~~~~~~~~

| migrate_set_cache_size value – set cache size (in bytes) for XBZRLE
  migrations,the cache size will be rounded down to the nearest power of
  2.
| The cache size affects the number of cache misses.In case of a high
  cache miss ratio you need to increase the cache size

migrate_set_capability
~~~~~~~~~~~~~~~~~~~~~~

migrate_set_capability capability state – Enable/Disable the usage of a
capability for migration

migrate_set_downtime
~~~~~~~~~~~~~~~~~~~~

migrate_set_downtime value – set maximum tolerated downtime (in seconds)
for migrations

migrate_set_parameter
~~~~~~~~~~~~~~~~~~~~~

migrate_set_parameter parameter value – Set the parameter for migration

migrate_set_speed
~~~~~~~~~~~~~~~~~

migrate_set_speed value – set maximum speed (in bytes) for migrations.
Defaults to MB if no size suffix is specified, ie. B/K/M/G/T

migrate_start_postcopy
~~~~~~~~~~~~~~~~~~~~~~

migrate_start_postcopy – Followup to a migration command to switch the
migration to postcopy mode. The postcopy-ram capability must be set on
both source and destination before the original migration command.

mouse_button
~~~~~~~~~~~~

mouse_button state – change mouse button state (1=L, 2=M, 4=R)

mouse_move
~~~~~~~~~~

mouse_move dx dy [dz] – send mouse move events

mouse_set
~~~~~~~~~

mouse_set index – set which mouse device receives events

N
-

nbd_server_add
~~~~~~~~~~~~~~

nbd_server_add nbd_server_add [-w] device [name] – export a block device
via NBD

nbd_server_remove
~~~~~~~~~~~~~~~~~

nbd_server_remove nbd_server_remove [-f] name – remove an export
previously exposed via NBD

nbd_server_start
~~~~~~~~~~~~~~~~

nbd_server_start nbd_server_start [-a] [-w] host:port – serve block
devices on the given host and port

nbd_server_stop
~~~~~~~~~~~~~~~

nbd_server_stop nbd_server_stop – stop serving block devices using the
NBD protocol

netdev_add
~~~~~~~~~~

netdev_add
[user|tap|socket|vde|bridge|hubport|netmap|vhost-user],id=str[,prop=value][,…]
– add host network device

netdev_del
~~~~~~~~~~

netdev_del id – remove host network device

nmi
~~~

nmi – inject an NMI

O
-

.. _o-1:

o
~

o /fmt addr value – I/O port write

object_add
~~~~~~~~~~

object_add [qom-type=]type,id=str[,prop=value][,…] – create QOM object

object_del
~~~~~~~~~~

object_del id – destroy QOM object

os
~~

os type – Enable os handlers and activate the specified type.

P
-

pcie_aer_inject_error
~~~~~~~~~~~~~~~~~~~~~

| pcie_aer_inject_error [-a] [-c] id [ []] – inject pcie aer error
| -a for advisory non fatal error
| -c for correctable error
| id = qdev device id
| error_status = error string or 32bit
| tlb header = 32bit x 4
| tlb header prefix = 32bit x 4

pid
~~~

pid (null) –

pmemsave
~~~~~~~~

pmemsave addr size file – save to disk physical memory dump starting at
‘addr’ of size ‘size’

ps
~~

ps –

print
~~~~~

p|print /fmt expr – print expression value (use $reg for CPU register
access)

Q
-

qemu-io
~~~~~~~

qemu-io [device] “[command]” – run a qemu-io command on a block device

qom-list
~~~~~~~~

qom-list path – list QOM properties

qom-set
~~~~~~~

qom-set path property value – set QOM property

quit
~~~~

q|quit – quit the emulator

R
-

ringbuf_read
~~~~~~~~~~~~

ringbuf_read device size – Read from a ring buffer character device

ringbuf_write
~~~~~~~~~~~~~

ringbuf_write device data – Write to a ring buffer character device

rloadvm
~~~~~~~

rloadvm file – Loads the system state from a rsave snapshot

rmbp
~~~~

rmbp (null) –

rsavevm
~~~~~~~

rsavevm file – Saves the system state to a rsave snapshot

S
-

savevm
~~~~~~

savevm tag – save a VM snapshot. If no tag is provided, a new snapshot
is created

screendump
~~~~~~~~~~

screendump filename [device [head]] – save screen from head ‘head’ of
display device ‘device’ into PPM image ‘filename’

sendkey
~~~~~~~

sendkey keys [hold_ms] – send keys to the VM (e.g. ‘sendkey
ctrl-alt-f1’, default hold time=100 ms)

set_link
~~~~~~~~

set_link name on|off – change the link status of a network adapter

set_password
~~~~~~~~~~~~

set_password protocol password action-if-connected – set spice/vnc
password

singlestep
~~~~~~~~~~

singlestep [on|off] – run emulation in singlestep mode or switch to
normal mode

snapshot
~~~~~~~~

snapshot_blkdev [-n] device [new-image-file] [format] – initiates a live
snapshot of device. If a new image file is specified, the new image file
will become the new root image. If format is specified, the snapshot
file will be created in that format. The default format is qcow2. The -n
flag requests QEMU to reuse the image found in new-image-file, instead
of recreating it from scratch.

snapshot_blkdev_internal
~~~~~~~~~~~~~~~~~~~~~~~~

snapshot_blkdev_internal device name – take an internal snapshot of
device. The format of the image used by device must support it, such as
qcow2.

snapshot_delete_blkdev_internal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

snapshot_delete_blkdev_internal device name [id] – delete an internal
snapshot of device. If id is specified, qemu will try delete the
snapshot matching both id and name. The format of the image used by
device must support it, such as qcow2.

stop
~~~~

stop – stop emulation

stopcapture
~~~~~~~~~~~

stopcapture capture index – stop capture

sum
~~~

sum addr size – compute the checksum of a memory region

sync-profile
~~~~~~~~~~~~

sync-profile [on|off|reset] – enable, disable or reset synchronization
profiling. With no arguments, prints whether profiling is on or off.

system_powerdown
~~~~~~~~~~~~~~~~

system_powerdown – send system power down event

system_reset
~~~~~~~~~~~~

system_reset – reset the system

system_wakeup
~~~~~~~~~~~~~

system_wakeup – wakeup guest from suspend

T
-

trace-event
~~~~~~~~~~~

trace-event name on|off [vcpu] – changes status of a specific trace
event (vcpu: vCPU to set, default is all)

U
-

unpid
~~~~~

unpid (null) –

W
-

watchdog_action
~~~~~~~~~~~~~~~

watchdog_action [reset|shutdown|poweroff|pause|debug|none] – change
watchdog action

wavcapture
~~~~~~~~~~

wavcapture path [frequency [bits [channels]]] – capture audio to a wave
file (default frequency=44100 bits=16 channels=2)

X
-

.. _x-1:

x
~

x /fmt addr – virtual memory dump starting at ‘addr’

x_colo_lost_heartbeat
~~~~~~~~~~~~~~~~~~~~~

x_colo_lost_heartbeat – Tell COLO that heartbeat is lost, a failover or
takeover is needed.

xp
~~

xp /fmt addr – physical memory dump starting at ‘addr’
