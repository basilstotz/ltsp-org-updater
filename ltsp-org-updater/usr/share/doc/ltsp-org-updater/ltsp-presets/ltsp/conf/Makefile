.PHONY: update
update: /srv/tftp/ltsp/ltsp.img /etc/cron.d/ltsp-org-updater-start 

/srv/tftp/ltsp/ltsp.img: /etc/passwd /etc/group /etc/shadow /etc/ltsp/ltsp.conf  /etc/ltsp/init/* /etc/ltsp/bin/* 
	/usr/local/sbin/ltsp-org-updater --config

/etc/cron.d/ltsp-org-updater-start: /etc/ltsp/updater.conf
	/usr/local/sbin/ltsp-org-updater --cron
