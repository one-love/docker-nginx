#!/bin/bash

set -e

apt-get -yqq update
apt-get -yqq upgrade

apt-get install -yqq wget
wget -q --no-check-certificate https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 -O /usr/bin/confd
chmod 755 /usr/bin/confd
rm /var/log/nginx/* /etc/nginx/conf.d/*

apt-get purge -yqq wget
apt-get autoremove -yqq --purge
apt-get clean -yqq
