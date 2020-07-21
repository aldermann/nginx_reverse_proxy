ssl_certificate /etc/letsencrypt/live/callmeduy.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/callmeduy.com/privkey.pem;
ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers 'kEECDH+ECDSA+AES128 kEECDH+ECDSA+AES256 kEECDH+AES128 kEECDH+AES256 kEDH+AES128 kEDH+AES256 DES-CBC3-SHA +SHA !aNULL !eNULL !LOW !kECDH !DSS !MD5 !RC4 !EXP !PSK !SRP !CAMELLIA !SEED';
ssl_prefer_server_ciphers on;
# add_header Strict-Transport-Security "max-age=31536000; preload" always;
