#!/bin/bash
if [[ -z $KEY_FILE ]]; then
  /usr/bin/gcsfuse -o ro $BUCKET_NAME $MOUNT_POINT
else
  /usr/bin/gcsfuse -o ro --key-file $KEY_FILE $BUCKET_NAME $MOUNT_POINT
fi


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

[server]
client = no
accept = ${ACCEPT}
connect = ${CONNECT}
cert = ${MOUNT_POINT}/stunnel.pem
EOF

/usr/bin/stunnel4
tail -f /dev/null
