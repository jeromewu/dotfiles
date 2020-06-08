#!/bin/sh

curl -X POST \
  -F 'hostname=wu-home16' \
  http://iplookup.asus.com/nslookup.php > /tmp/asus-nslookup

IP=$(grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}' /tmp/asus-nslookup)

ssh -p 10022 pi@${IP}
