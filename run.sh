#!/bin/bash

set -e

rm /etc/nginx/conf.d/*
/opt/bin/consul-template -config /app/consul/nginx.conf
sleep 1
tail -f /var/log/nginx.log
