


# ltsp-org-updater

_ltsp-org-updater_ is a Debian package to turn a (vanilla) Debian installation to a preconfigured LTSP-server (https://ltsp.org) using ready to use and regularly updated images from Lernstick (https://www.bfh.ch/de/forschung/forschungsbereiche/lernstick/)

The package  
* installs all LTSP packages and all it's dependencies.
* preconfigures the LTSP installation with (hopefully) reasonable defaults in order to use use Lernstick images.


It consists of 2 parts:
* A daemon, which configures all LTSP services like Proxy-DHCPD, NFS at startup. It also updates (every 60 seconds) the LTSP config, when users or config files have changed.
* A cron job, which check for updated Lernstick images und installs then if a new one is available.

There are 2 config files:
* *ltsp.conf* this a the config for LTSP
* *updater.conf* this configures the image updater

### In Detail

### /etc/ltsp

The whole dir ```/etc/ltsp/``` is copied to client. This means you can add arbitray files/dirs, which you need inside the client.

### Kernal Parameters

Next to the usual Debian-Live parameters the is an option to use every (capable) fatclient as an wlan hotspot: When the option
```KERNEL_PARAMETERS=" ... hostspot=<SSID>,<PASSWD> ...``` in file ```/etc/ltsp/ltsp.conf``` 
, is given the client will setup an wlan hotspot with SSID <SSID> and >PASSWD> as password.

### Post Init Scripts

 The directory ```/etc/ltsp/init/``` contains init-script, which executed during boot after init and before systemd. They are called
 by the ```POST_INIT_RUN_PARTS="/usr/bin/run-parts /etc/ltsp/init/``` in file ```/etc/ltsp/ltsp.conf```
 

## Build Debian Package

```
$ git clone https://github.com/basilstotz/ltsp-org-updater
$ cd ltsp-org-updater
$ make
```

