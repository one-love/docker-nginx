#!/bin/bash

set -e

PACKAGES="git-core libpython2.7 postgresql-server-dev-all python python-dev wget python-pip"

apt-get update -y
apt-get upgrade -y
apt-get install -y $PACKAGES

git clone https://github.com/one-love/api.git
cd api
mv /app/__init__.py project/settings
pip install -r requirements.txt
mkdir /static
python manage.py collectstatic --noinput

wget https://github.com/hashicorp/consul-template/releases/download/v0.9.0/consul-template_0.9.0_linux_amd64.tar.gz -O /tmp/consul-template.tar.gz
cd /tmp
tar xfvp consul-template.tar.gz
mv consul-template*/consul-template /bin

echo "Cleanup"
cd ..
rm -rf /usr/local api
apt-get purge -y $PACKAGES
apt-get autoremove -y --purge
apt-get clean -y
