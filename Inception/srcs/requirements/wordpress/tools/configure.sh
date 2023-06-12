#! /bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then

    wp core download --path="/var/www/html"  --alow-root

    wp config create --path="/var/www/html" \
    --dbuser=$MYSQL_USERNAME \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=$MYSQL_HOSTNAME \
    --dbname=$MYSQL_DATABASE \
    --alow-root

    wp core install --path="/var/www/html" \
    --url="https://$DOMAIN_NAME/" \
    --title="Example Site" \
    --admin_user=$WP_ADMIN_USERNAME \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_USERNAME@$DOMAIN_NAME \
    --skip-email \
    --allow-root

    wp user create $WP_USER_USERNAME $WP_USER_USERNAME@$DOMAIN_NAME \
        --path="/var/www/html" \
        --user_pass=$WP_USER_PASSWORD \
        --allow-root
else
    echo "Wordpress is already installed"
fi

exec $@