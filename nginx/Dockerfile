FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

# Install Nginx and other necessary packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y bash nginx wget openssl

# Create directories
RUN mkdir -p /etc/nginx/ssl/
# Copy Nginx configuration
COPY ./conf.d /etc/nginx/conf.d

# Set the working directory
WORKDIR /var/www

# Download and Extract WordPress
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz \
    && rm -r /var/www/html

# Remove default Nginx site configuration
RUN rm /etc/nginx/sites-enabled/default \
    && rm /etc/nginx/sites-available/default

# Clean up
RUN apt-get clean \
    && rm -r latest.tar.gz \
    && rm -rf /var/lib/apt/lists/*

# Set the entry point
ENTRYPOINT ["nginx", "-g", "daemon off;"]
