#!/bin/bash

export COMMAND="consul-template -config /app/consul/nginx.conf"

service nginx restart
rm -rf /etc/nginx/conf.d/*
echo -n "Waiting for initial config "
until $COMMAND -once; do
    echo -n "."
    sleep 3
done
echo " done"

$COMMAND
