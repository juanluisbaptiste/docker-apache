ARG APACHE_VERSION=""
FROM httpd:${APACHE_VERSION:-2.4}
LABEL maintainer="Juan Luis Baptiste <juan@juanbaptiste.tech>"

RUN apt update && \
    apt upgrade -y

# Copy apache vhost file to proxy php requests to php-fpm container
COPY 000-default.conf /usr/local/apache2/conf/
COPY conf/ /usr/local/apache2/conf/conf/
COPY run.sh /
RUN echo "Include /usr/local/apache2/conf/000-default.conf" \
    >> /usr/local/apache2/conf/httpd.conf && \
    echo "Include /usr/local/apache2/conf/conf/*.conf" \
        >> /usr/local/apache2/conf/httpd.conf && \
    chmod 755 /run.sh
ENTRYPOINT ["/run.sh"]
