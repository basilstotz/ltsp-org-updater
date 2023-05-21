


# Introduction  to LTSP

LTSP is an easy way to manage any amount of students computers with a minimum effort. 
- You only have to mange one sample computer, the so called **LTSP-Server**. On this computer you can add/remove user, install/remove programms as you like, just you would do with an 'normal' Ubuntu.
- All other computers, the so called **LTSP-Clients**, are always automatically exact clones of this LTSP-Server. They need no maintainence at all. 

## LTSP Network Setup

This manual assumes you have this (typical home or small office) setup (using DHCP in the router):  

![network-1](https://user-images.githubusercontent.com/3853260/143925099-8ea63fc5-d756-4987-b090-3140dc4e5519.png)

The LTSP-Server (the computer with the LTSP-Updater App) and any number of LTSP-Clients are connected to the network just like the normal client would be connected. So your network will look like this:


![network-2](https://user-images.githubusercontent.com/3853260/143925125-dbddc292-9137-4aa9-a658-dfa9f720eb42.png)

## LTSP-Server

The LTSP-Server is a vanilla Ubuntu installation, where the Package ltsp-org-updater is installed. (See Quick Start further down ...)


## LTSP-Clients

You can use any number (ok, maybe up to 50 or so) with any computers (even without harddisk) as an LTSP-Clients. The only thing you have to do is setting the BIOS bootorder to *network boot* or *PXE-Boot*.

Remember: You don't have to install anything on the clients, just setting the boot order to PXE-Boot is realy enough! All the clients are always the same a the main server.


# ltsp-org-updater

Install a and maintain LTSP-Server (http://ltsp.org) without any "shell things" on a Ubuntu box. It's designed for teachers with no experience on the shell.



## Build Debian Package

```
$ git clone https://github.com/basilstotz/ltsp-org-updater
$ cd ltsp-org-updater
$ make
```

