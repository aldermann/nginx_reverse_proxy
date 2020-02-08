#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo"
  exit
fi
echo "After issuing finish please ctrl-C"
sleep 2
docker-compose up certbot_issue nginx_issue
docker-compose down
openssl dhparam -out ../data/certbot/conf/ssl-dhparams.pem 2048
echo "#!/bin/bash
docker-compose -f $(pwd)/../docker-compose.yml run certbot_renew" > /etc/cron.monthly/renew_cert.sh
chmod +x /etc/cron.monthly/renew_cert.sh