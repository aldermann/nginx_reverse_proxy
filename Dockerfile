FROM nginx:latest

ARG CONFIG_PATH=nginx

RUN rm /etc/nginx/conf.d/default.conf && \
    mkdir -p /var/www/html/

COPY ./config/$CONFIG_PATH /etc/nginx/conf.d

COPY ./config/route.conf.inc /etc/nginx/conf.d/route.conf.inc
