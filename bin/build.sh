#!/bin/bash

set -e

apt-get update -y
apt-get upgrade -y
apt-get install -y wget

# Get consul-template
wget https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_amd64.tar.gz -O /tmp/consul-template.tar.gz
cd /tmp
tar xfvp consul-template.tar.gz
mv consul-template*/consul-template /bin

echo "Cleanup"
apt-get purge -y wget
apt-get autoremove -y --purge
apt-get clean -y
