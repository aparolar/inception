#!bin/bash/

mv -f wordpress /var/www/
rm wordpress-6.1.1.tar.gz

mv /tmp/wp-config.php /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/

sed -i -e "s|MYSQL_DATABASE|'$MYSQL_DATABASE'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|MYSQL_USER|'$MYSQL_USER'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|MYSQL_PASSWORD|'$MYSQL_PASSWORD'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf
mkdir -p /run/php/
exec /usr/sbin/php-fpm7.3