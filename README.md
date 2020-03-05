# Shoggoth QEMU

Shoggoth is a heavily modified fork of [QEMU](https://github.com/qemu/qemu)
3.0 designed for high performance Dynamic Binary Instrumentation (DBI) of a
complete system with options to perform focused user-mode analysis. Features
added to QEMU include operating system handlers, external plugins, and Rapid
Analysis (RA). OS handlers enable user-mode analysis within a system context
while maintaining interactions with the OS provided kernel, drivers, and
libraries. Dynamically loaded plugins extend QEMU features and provide DBI of
the executing virtual machine. Rapid Analysis operates as a separate execution
mode which provides rapid loading and saving of execution history for a live
system. All these features work together to offer a complete DBI solution for
deep target analysis.


## Getting Started

### Prerequisites

Before building Shoggoth, you'll need to install some dependencies and
configure your build environment. Please see or run the provided
[`init.sh`](init.sh) script for this (will prompt for a password to install
packages).

### Building

Once your development environment has been configured, the `qemu-shoggoth`
folder will contain the latest stable code for Shoggoth. The shell scripts and
live snapshots in this repository, `shoggoth-extras`, provide examples of the
added features.

You can build Shoggoth with the included [`./build.sh`](build.sh) script.
Shoggoth will take a while to build, so go get a mocha.


## Running Shoggoth

### Traditional Execution

Shoggoth can be used just like traditional QEMU execution but with the added
features of OS handlers and external plugins. OS handlers are accessed through
the monitor (CLI) and QMP interfaces. External plugins are capable of extending
OS handlers, devices, machines, and plugin languages or adding instrumentation
for memory reads/writes, CPU registers, executing instructions, syscalls,
interrupts, exceptions, ingress/egress network packets, breakpoints, VM state,
and Rapid Analysis (when RA is active). Python 3 plugins are partially
supported, but still considered experimental.

Use the provided [`run_debian9.sh`](run_debian9.sh) script for an example of
traditional QEMU execution. Username is "user", password is "user".

#### OS Handlers

When the OS has booted, use the `os` command to activate OS handler support.
We can't guarantee full support for most OSes, but we plan to integrate
[Volatility](https://www.volatilityfoundation.org/) through an OS handler
plugin which will provide more comprehensive OS support.

```
(qemu) os
Found OS linux!
(qemu) ps
PID	CR3		TGID 	NAME
->0	3cb0f000 	0 	swapper/0
->1	3cb0f000 	1 	systemd
162	369f0000 	162 	systemd-journal
194	3a68f000 	194 	systemd-udevd
223	38ce9000 	223 	systemd-timesyn
249	3a740000 	249 	dbus-daemon
264	3a618000 	264 	rsyslogd
265	3a7d1000 	265 	cron
268	3a79c000 	268 	systemd-logind
324	3cbf8000 	324 	login
442	3c0d8000 	442 	bash
354	39e43000 	354 	dhclient
(qemu) pid 354
PID	CR3		TGID 	NAME
->0	3a7d1000 	0 	swapper/0
1	3cb0f000 	1 	systemd
162	369f0000 	162 	systemd-journal
194	3a68f000 	194 	systemd-udevd
223	38ce9000 	223 	systemd-timesyn
249	3a740000 	249 	dbus-daemon
264	3a618000 	264 	rsyslogd
->265	3a7d1000 	265 	cron
268	3a79c000 	268 	systemd-logind
324	3cbf8000 	324 	login
442	3c0d8000 	442 	bash
*354	39e43000 	354 	dhclient
```

The `ps` listing uses `->` to denote the active application and `*` to denote
the application in focus. Use the `pid` command to set the application focus.

#### Debugging

Once an application is in focus, breakpoints can be set for process debugging
or analysis. Note that setting a breakpoint with no active focus results in an
anonymous breakpoint that can be triggered for any application that executes
the address.

```
(qemu) stop
(qemu) bp 0x5000000
Set breakpoint id 0 at address 5000000
(qemu) bplist
ID	Address
0	0x5000000
(qemu) c
```

Use the `unpid` command to remove application focus:

```
(qemu) unpid
```

Unlike traditional GDB, breakpoints stop the entire system. After which, all
registers and memory states can be observed through monitor commands. A more
advanced triaging CLI is currently in development.

The current live snapshot of a virtual machine can be used for Rapid Analysis
by using the `rsavevm` command:

```
(qemu) rsavevm my_vm_state
```

### Rapid Analysis Execution

RA is a separate execution mode that enables rapid saving and loading of a live
system. Actual performance can vary by system but typical times are in tens of
milliseconds for both saving and loading, with saving being on average 2x as
costly as a load. Control of RA mode is exposed through either a TCP socket or
plugin. SHA1 hashes are used to indicate the chronological execution state of a
live system. Use the [`info.sh`](info.sh) script to view the available states
of a vmstate file:

```
$./info.sh exec_me.vmstate
image: ff26c69bf0389fec2afb52c86ee3359dd7de6cbc
file format: Root VMState
virtual size: 180M (188554836 bytes)
disk size: 180M
Snapshot list:
ID        TAG                 VM SIZE                DATE       VM CLOCK
-1        0000000000000000000000000000000000000000      0 1969-12-31 16:33:13   00:00:00.000

image: be9f86320f28ec64fa257f6c57a61dc90ded648b
file format: Rapid Analysis VMState
virtual size: 447K (457270 bytes)
disk size: 447K
Snapshot list:
ID        TAG                 VM SIZE                DATE       VM CLOCK
-1        ff26c69bf0389fec2afb52c86ee3359dd7de6cbc      0 1969-12-31 16:33:14   00:00:00.000
```

A demo of the TCP interface for RA mode control is provided by the
[`ctrl_execme.sh`](ctrl_execme.sh) and [`rsave_execme.sh`](rsave_execme.sh)
scripts:

```
$./ctrl_execme.sh
(open a new terminal)
$./rsave_execme.sh
```

A demo of the plugin interface for RA mode control is provided by the
[`run_pwnme_little.sh`](run_pwnme_little.sh) and
[`run_pwnme_lots.sh`](run_pwnme_lots.sh) scripts:

```
$./run_pwnme_lots.sh
```

`run_pwnme_lots.sh` demonstratetes control of an RA session through the "C"
plugin (see `pwnme_lots_solve` in the plugins directory) shared library. The
"C" interface for this release is considered very stable. The plugin will
execute a code coverage guided fuzzer that will attempt to execute a specific
branch in the code which triggers a buffer overflow on the stack.

```
$./run_pwnme_little.sh
```

`run_pwnme_little.sh` demonstrates control of an RA session through a Python 3
plugin (see `pwnme_little_bof` in the plugins directory). Note that the
Python 3 interface is still considered experimental. The plugin will detect the
location of a buffer overflow on the stack that overwrites the `main`
function's return pointer.

### Plugins

Plugins reside in the `qemu-shoggoth/plugins` folder and provide support for
extension or instrumentation of a virtual machine. After compilation, the plugins
will be installed to the qemu plugins folder whose default location is `~/.qemuplugins`.
The plugin installation directory can be modified during configuration with `--plugindir`.

Create skeletons for new plugins using the
[`wizard.py`](qemu-shoggoth/plugins/wizard.py) script in the plugins directory.

```
$./wizard.py create my_plugin
(note callbacks can be added at create time as well)
$./wizard.py create myplugin -cb exception
```


## Versioning

We intend to use [Semantic Versioning](http://semver.org/) for versioning. This
may be a little rough at first while we transition Shoggoth out of being
internal to the company. For the versions available, see the
[tags on this repository](https://github.com/your/project/tags).


## Contact

This project is currently maintained by the Shoggoth team at
[Cromulence](https://cromulence.com/). We can be reached directly via email
at `shoggoth [at] cromulence [dot] com`.


## License

This project is licensed under the GPLv2 - see the [LICENSE.md](LICENSE.md) file for details
