#!/bin/bash
/usr/bin/gcsfuse bucket-stunnel-cloud-run-demo-403212 /etc/cert
/usr/bin/stunnel
tail -f /dev/null
