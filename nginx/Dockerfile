FROM ubuntu
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y nginx wget
RUN rm -r /var/www/html
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default
COPY ./sites-available /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/
WORKDIR /var/www
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN service nginx restart
ENTRYPOINT ["nginx", "-g", "daemon off;"]