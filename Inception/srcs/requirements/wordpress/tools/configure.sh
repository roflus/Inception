#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then
        echo "installing Wordpress"
        wp-cli.phar core download --path="/var/www/html" --allow-root

        wp-cli.phar config create --path="/var/www/html" \
        --dbuser=$MYSQL_USERNAME \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=$MYSQL_HOSTNAME \
        --dbname=$MYSQL_DATABASE \
        --allow-root

        wp-cli.phar core install --path="/var/www/html" \
        --url="https://$DOMAIN_NAME/" \
        --title="Example Site" \
        --admin_user=$WP_ADMIN_USERNAME \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_USERNAME@$DOMAIN_NAME \
        --skip-email \
        --allow-root

        wp-cli.phar user create $WP_USER_USERNAME $WP_USER_USERNAME@$DOMAIN_NAME \
        --path="/var/www/html" \
        --user_pass=$WP_USER_PASSWORD \
        --allow-root

else
        echo "Wordpress is already installed"
fi

exec "$@"