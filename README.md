# ltsp-org-updater

Install a and maintain LTSP-Server (http://ltsp.org) without any "shell things" on a Ubuntu box. It's designed for teachers with no experience on the shell.

## Quick Start

- Downlaod the Debian package (https://github.com/basilstotz/ubuntu-ltsp-updater/releases/download/v0.01/ltsp-updater-amd64.deb) and doppleclick on it in order to install the package. You can safely delete the package afterwards.
- Search for the `LTSP-Updater` application and run it. At first run, it will download and install some additional software. Then it clones the host computer for the clients. This may take a very long time. Consider up to 30 minutes!  
- Whenever you make changes (install/remove software or add/remove users) run the `LTSP-Updater` again. This may take a very long time. Consider up to 30 minutes! 

## Build Debian Package

```
$ git clone https://github.com/basilstotz/ltsp-org-updater
$ make
```

