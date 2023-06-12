#! /bin/bash

if [! -f "/var/www/html/wp-config.php"]; then

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wi-cli.phar usr/local/bin/wp

    wp core download --path="/var/www/html"  --alow-root

    wp config create --path="/var/www/html" \
    --dbuser=$MYSQL_USERNAME \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=$MYSQL_HOSTNAME \
    --dbname=$MYSQL_DATABASE \
    --alow-root

    wp core install --path="/var/www/html" \
    --title="Example Site" \
    --



    mv /var/www/html/wp-config-sample.php /var/ww/html/wp-config.php

    sed -i -r "s/database/$/1"   wp-config.php
    set-i -r "s/database/$db_user/1"