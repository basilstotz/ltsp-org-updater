#!/bin/sh

cat <<EOF > /etc/systemd/system/make-accesspoint.service
[Unit]
Description=Setup Accesspoint
After=network.target

[Service]
Type=oneshot
ExecStart=/etc/ltsp/make-accesspoint.sh
#RemainAfterExit=true
#ExecStop=/opt/foo/teardown-foo.sh
#StandardOutput=journal

[Install]
WantedBy=multi-user.target
EOF

/usr/bin/systemctl enable make-accesspoint.service

