.PHONY: update
update: /srv/tftp/ltsp/ltsp.img /etc/crond.d/ltsp-org-updater-start 

/srv/tftp/ltsp/ltsp.img: /etc/passwd /etc/group /etc/shadow /etc/ltsp/ltsp.conf  /etc/ltsp/init/* /etc/ltsp/bin/* 
	ltsp initrd
	ltsp ipxe
	mkdir -p /home/.login
	chmod 600 /home/.login
	cp /etc/passwd /home/.login/passwd
	cp /etc/group /home/.login/group
	cp /etc/shadow /home/.login/shadow
	test -f /etc/gshadow && cp /etc/gshadow /home/.login/gshadow

/etc/cron.d/ltsp-org-updater-start: /etc/ltsp/ltsp-org-updater.conf
	/usr/local/bin/ltsp-org-updater --cron
