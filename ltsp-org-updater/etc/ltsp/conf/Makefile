DIR:=/srv/tftp/ltsp

.PHONY: update
update: $(DIR)/ltsp.img 

$(DIR)/ltsp.img: /etc/passwd /etc/group /etc/shadow /etc/ltsp/ltsp.conf  /etc/ltsp/init/* /etc/ltsp/bin/* 
        ltsp initrd
        ltsp ipxe
        mkdir -p /home/.login
        chmod 600 /home/.login
        cp /etc/passwd /home/.login/passwd
        cp /etc/group /home/.login/group
        cp /etc/shadow /home/.login/shadow
        test -f /etc/gshadow && cp /etc/gshadow /home/.login/gshadow
