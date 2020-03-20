FROM nginx:latest

ARG CONFIG_PATH=nginx

RUN rm /etc/nginx/conf.d/default.conf

COPY ./config/$CONFIG_PATH /etc/nginx/conf.d
