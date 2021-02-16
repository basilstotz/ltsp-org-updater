# ubuntu-ltsp-updater

Install a and maintain LTSP-Server (http://ltsp.org) on a Ubuntu or a Debian box. 

- Downlaod the Debian package (https://github.com/basilstotz/ubuntu-ltsp-updater/releases/download/v0.01/ltsp-updater-amd64.deb) and doppleclick on it in order to install the package.
- Search for the `LTSP-Updater` application and run it.
- Whenever you make changes (install/remove software or add/remove users) run the `LTSP-Updater` again.

To build the Debain package:

```
$ git clone https://github.com/basilstotz/ubuntu-ltsp-updater
$ make
```
