#!/bin/bash

set -e

PACKAGES="git-core libpython2.7 postgresql-server-dev-all python python-dev wget python-pip"

apt-get update
apt-get upgrade
apt-get install -y $PACKAGES
git clone https://github.com/one-love/api.git
cd api
mv /app/__init__.py project/settings
pip install -r requirements.txt
mkdir /static
python manage.py collectstatic --noinput
cd ..
rm -rf /usr/local api
apt-get purge -y $PACKAGES
apt-get autoremove -y --purge
apt-get clean
