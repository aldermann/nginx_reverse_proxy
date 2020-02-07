#!/bin/bash
echo "After issuing finish please ctrl-C"
if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo"
  exit
fi
docker-compose up certbot_issue nginx_issue
docker-compose down
echo "#!/bin/bash
docker-compose -f $(pwd)/docker-compose.yml run certbot_renew" > /etc/cron.monthly/renew_cert.sh
chmod +x /etc/cron.monthly/renew_cert.sh