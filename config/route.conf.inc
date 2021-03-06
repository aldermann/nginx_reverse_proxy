root /var/www/html;

index index.html;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header Host $host;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;

location / {
  try_files $uri $uri/ @service;
  expires max;
  access_log off;
}

location @service {
   proxy_pass http://service:8000;
}

