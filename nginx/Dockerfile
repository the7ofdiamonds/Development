FROM nginx:latest

COPY entrypoint.sh /docker-entrypoint.d/entrypoint.sh

RUN chmod +x /docker-entrypoint.d/entrypoint.sh

COPY templates /etc/nginx/templates
COPY ssl/certs/dhparam.pem /etc/ssl/certs/dhparam.pem
COPY ssl/certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY ssl/private/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
COPY snippets/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY snippets/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

WORKDIR /var/www

RUN rm -rf /var/www/html

CMD ["nginx", "-g", "daemon off;"]