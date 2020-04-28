#!/bin/bash
set -x
APACHE2_CONF_FILE="/usr/local/apache2/conf//000-default.conf"

sed -i -e "s#php-fpm:9000#${PHP_FPM_HOSTNAME}:9000#g" ${APACHE2_CONF_FILE}

/usr/local/apache2/bin/httpd -DFOREGROUND
