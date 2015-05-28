#!/bin/bash

set -e

export COMMAND="consul-template -config /app/consul/nginx.conf"

service nginx restart
$COMMAND &
tail -f /var/log/nginx/*

