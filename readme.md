# XXI: System Toolkit by livingSatire

### NOTE: XXI is NOT ready for use. It is not even pre-alpha.

## About
XXI is a system toolkit for maintaining a Linux system. It is not a distro, but a small collection of tools for maintaining your own system.

## The Bash addict that is package building
One of the main problems with most distros is a hard dependency on Bash for build scripts. XXI instead uses POSIX scripts for building, so you can use any POSIX-compliant shell to build and run an XXI-based system.

## Dependencies
### Outside system dependencies
- A fine Linux system to bootstrap from
- A Turing-complete computer with Linux kernel support

### XXI dependencies
- POSIX shell
- Mostly* POSIX-compliant userspace utilities (BusyBox, Toybox, GNU Utils)
- A `tar` implementation
