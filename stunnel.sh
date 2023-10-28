#!/bin/bash
/usr/bin/gcsfuse bucket-stunnel-cloud-run-demo-403212 /etc/stunnel
/usr/bin/stunnel
tail -f /dev/null
