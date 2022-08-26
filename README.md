# Debian Minimal: Live Build using Github Actions
This repository provides a live build environment for Debian-based systems via Github Actions.
In the example stored here a minimal system is built, which is booted via PXE on a system, 
after the boot a script will be downloaded from a webserver and executed (see `/root/.bashrc`).
The path to the script need to be provided in the bootloader configuration, see `syslinux.cfg`.
