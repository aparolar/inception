#!/bin/bash

service mysql start
db_exist=$(echo "SHOW DATABASES" | mysql -u root | grep "wp_db" | wc -l)
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root
if [ $db_exist = "0" ]
then
	mysql mysql -u root < /tmp/db-mysql.sql
	mysql wp_db -u root < /tmp/wp-saved.sql
fi
service mysql stop
exec /usr/sbin/mysqld -u root
