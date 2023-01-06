#!/bin/bash

set -e

mkdir -p /home/lpm
groupadd -g $GID lpm
useradd -u $UID -g lpm -d /home/lpm lpm
chown -R lpm:lpm /home/lpm
usermod -aG lazarus lpm

if [[ ! -d /project ]]; then
  mkdir -p /project
fi
chown lpm:lpm -R /project
cd /project

sudo -u lpm lpm self-updatelpm lazarus add default /fpclaz/lazarus
sudo -u lpm lpm self-update
sudo -u lpm lpm update

exec sudo -u lpm $@