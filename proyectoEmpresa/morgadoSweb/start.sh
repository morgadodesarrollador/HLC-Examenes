#!/bin/bash
set -e
...
source /etc/apache2/envvars
rm -f /var/run/apache2/apache2.pid
...

/etc/init.d/ssh start
/usr/sbin/apache2 -DFOREGROUND
tail -f /dev/null



