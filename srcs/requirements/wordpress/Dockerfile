FROM			debian:buster
COPY			tools/setup_wp.sh /tmp
COPY			conf/wp-config.php /tmp

RUN			apt-get update \
			&& apt-get install php-fpm php-mysql curl dumb-init tar vim -y \
			&& echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf \
			&& curl -LO https://wordpress.org/wordpress-6.1.1.tar.gz \
			&& tar xzvf wordpress-6.1.1.tar.gz

RUN			chmod +x /tmp/setup_wp.sh

RUN			/tmp/setup_wp.sh
#ENTRYPOINT		["/usr/bin/dumb-init"]

EXPOSE			9000

CMD			[ "/usr/sbin/php-fpm7.3" ]
