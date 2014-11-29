#!/bin/bash

set -e

export COMMAND="/opt/bin/consul-template -config /etc/nginx/consul/nginx.conf"

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

