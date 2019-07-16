#!/bin/sh

cd /opt
apk --no-cache add tini make cmake gcc g++ git pkgconf

git clone https://github.com/3cky/mbusd.git src
cd src && cmake . && make && mv mbusd ..
cd /opt && rm -rf src

apk --no-cache del make cmake gcc g++ git pkgconf
