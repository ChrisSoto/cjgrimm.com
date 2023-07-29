FROM nginx:stable-alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN mkdir -p /var/www/html/public

ADD nginx/default.prod.conf /etc/nginx/conf.d/default.conf

ADD nginx/certs/cjgrimm.com.pem /etc/nginx/certs/cjgrimm.com.pem
ADD nginx/certs/cjgrimm.com.key /etc/nginx/certs/cjgrimm.com.key


RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

run adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}