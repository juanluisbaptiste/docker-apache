ARG APACHE_VERSION=""
FROM httpd:${APACHE_VERSION:-2.4}
LABEL maintainer="Juan Luis Baptiste <juan@juanbaptiste.tech>"

RUN apt update && \
    apt upgrade -y

# Copy apache vhost file to proxy php requests to php-fpm container
COPY 000-default.conf /usr/local/apache2/conf/
RUN echo "Include /usr/local/apache2/conf/000-default.conf" \
    >> /usr/local/apache2/conf/httpd.conf
