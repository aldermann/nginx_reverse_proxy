#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
command -v certbot >/dev/null 2>&1 || {
  echo >&2 "Certbot required but it's not installed. Installing"
  sudo apt-get update
  sudo apt-get install software-properties-common
  sudo add-apt-repository universe
  sudo add-apt-repository ppa:certbot/certbot
  sudo apt-get update
  sudo apt-get install certbot
}

certbot certonly --standalone \
  --email trancongvietan22@gmail.com \
  --agree-tos --no-eff-email --dry-run \
  --config-dir ./cert \
  --work-dir ./letsencrypt/working\
  --logs-dir ./letsencrypt/log \
  -d callmeduy.com \
  -d admin.callmeduy.com \
  -d www.callmeduy.com
