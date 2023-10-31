#!/bin/bash
/usr/bin/gcsfuse -o ro $BUCKET_NAME $MOUNT_POINT

cat << EOF > /etc/stunnel/stunnel.conf
; Some performance tunings
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
ciphers = ALL

; Authentication stuff
;verify = 2

; Some debugging stuff useful for troubleshooting
debug = 7
;output = /var/log/stunnel.log

[client]
accept=0.0.0.0:8080
client=yes
cert = ${MOUNT_POINT}/stunnel.pem
connect = localhost:8090

[server]
client = no
accept = ${ACCEPT}
connect = ${CONNECT}
cert = ${MOUNT_POINT}/stunnel.pem
EOF

/usr/bin/stunnel4
tail -f /dev/null
