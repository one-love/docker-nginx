#!/bin/bash

set -e

export COMMAND="consul-template -config /app/consul/nginx.conf"

nginx
rm -rf /etc/nginx/conf.d/*
echo -n "Waiting for initial config "
until $COMMAND -once; do
    echo -n "."
    sleep 3
done
echo " done"

$COMMAND &
sleep 1
tail -f /var/log/nginx/*

