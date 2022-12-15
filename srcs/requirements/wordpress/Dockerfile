FROM			debian:buster
COPY			tools/setup_wp.sh /tmp
COPY			conf/wp-config.php /tmp

RUN			apt-get update \
			&& apt-get install php-fpm php-mysql curl dumb-init tar -y \
			&& echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf \
			&& curl -LO https://wordpress.org/wordpress-6.1.1.tar.gz \
			&& tar xzvf wordpress-6.1.1.tar.gz

ENTRYPOINT		["/usr/bin/dumb-init"]
EXPOSE			9000
CMD			["bash", "/tmp/setup_wp.sh"]
