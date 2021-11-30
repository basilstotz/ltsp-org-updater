# ltsp-org-updater

Install a and maintain LTSP-Server (http://ltsp.org) without any "shell things" on a Ubuntu box. It's designed for teachers with no experience on the shell.

До українського перекладу: https://github.com/basilstotz/ltsp-org-updater/blob/main/README-UA.md




# LTSP Network Setup

This manual assumes you have this (typical home or small office) setup (using DHCP in the router):  

![network-1](https://user-images.githubusercontent.com/3853260/143925099-8ea63fc5-d756-4987-b090-3140dc4e5519.png)

The LTSP-Server (the computer with the LTSP-Updater App) and any number of LTSP-Clients are connected to the network just like the normal client would be connected. So your network will look like this:


![network-2](https://user-images.githubusercontent.com/3853260/143925125-dbddc292-9137-4aa9-a658-dfa9f720eb42.png)

# LTSP-Server






## Quick Start

- Downlaod the Debian package (https://github.com/basilstotz/ubuntu-ltsp-updater/releases/download/v0.01/ltsp-updater-amd64.deb) and doppleclick on it in order to install the package. You can safely delete the package afterwards.
- Search for the `LTSP-Updater` application and run it. At first run, it will download and install some additional software. Then it clones the host computer for the clients. This may take a very long time. Consider up to 30 minutes!  
- Whenever you make changes (install/remove software or add/remove users) run the `LTSP-Updater` again. This may take a very long time. Consider up to 30 minutes! 

## Build Debian Package

```
$ git clone https://github.com/basilstotz/ltsp-org-updater
$ make
```

