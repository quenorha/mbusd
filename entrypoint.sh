#!/bin/sh

exec /opt/mbusd -d -L /var/log/mbusd.log -c /opt/mbusd.conf -v9;
