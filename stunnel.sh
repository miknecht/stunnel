#!/bin/bash
/usr/bin/gcsfuse -o ro bucket-stunnel-cloud-run-demo-403212 /etc/cert
/usr/bin/stunnel4
tail -f /dev/null
