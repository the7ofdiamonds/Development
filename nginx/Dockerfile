FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y bash nginx wget openssl

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./wordpress.conf /etc/nginx/wordpress.conf

COPY ./sites-available /etc/nginx/sites-available

COPY ./ssl/certs/dhparam.pem /etc/ssl/certs/dhparam.pem

COPY ./ssl/certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
     
COPY ./ssl/private/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

COPY ./snippets/self-signed.conf /etc/nginx/snippets/self-signed.conf

COPY ./snippets/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

RUN ln -s /etc/nginx/sites-available/index.conf /etc/nginx/sites-enabled/

WORKDIR /var/www

RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz \
    && rm -r /var/www/html

RUN chown -R www-data:www-data /var/www/wordpress

RUN rm /etc/nginx/sites-enabled/default \
    && rm /etc/nginx/sites-available/default \
    && rm -r /etc/nginx/conf.d

RUN apt-get clean \
    && rm -r latest.tar.gz \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["nginx", "-g", "daemon off;"]