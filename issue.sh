#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo"
  exit
fi
echo "After issuing finish please ctrl-C"
sleep 1
docker-compose -f issue-compose.yml up certbot_issue nginx_issue
docker-compose down
openssl dhparam -out config/certbot/conf/ssl-dhparams.pem 4096
echo "#!/bin/bash
docker-compose -f $(pwd)/issue-compose.yml run certbot_renew" > /etc/cron.monthly/renew_cert.sh
chmod +x /etc/cron.monthly/renew_cert.sh