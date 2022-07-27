DIR:=ltsp

.PHONY: update
update: /srv/ltsp/images/dummy $(DIR)/ltsp.ipxe $(DIR)/ltsp.img 

/srv/ltsp/images/dummy:
	text -f /srv/ltsp/images/dummy || touch /srv/ltsp/images/dummy

$(DIR)/ltsp.ipxe: /srv/ltsp/images/*
	echo ltsp-org-updater --kernel
	ltsp ipxe

$(DIR)/ltsp.img: /etc/passwd /etc/group /etc/shadow /etc/ltsp/*
	ltsp initrd

