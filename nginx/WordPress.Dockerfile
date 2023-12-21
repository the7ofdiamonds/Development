FROM nginx

ARG DEBIAN_FRONTEND=noninteractive

COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY wordpress.conf /etc/nginx/wordpress.conf
COPY ssl/certs/dhparam.pem /etc/ssl/certs/dhparam.pem
COPY ssl/certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY ssl/private/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
COPY snippets/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY snippets/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

RUN mkdir -p /var/tmp/nginx && \
    chmod 755 /var/tmp/nginx && \
    chown -R nginx:nginx /var/tmp/nginx

WORKDIR /var/www

RUN rm -rf /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]