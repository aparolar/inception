FROM		debian:buster

COPY		tools/setup_db.sh /tmp
COPY		conf/my.cnf /tmp
COPY		conf/wp-saved.sql /tmp
COPY		conf/db-mysql.sql /tmp

RUN		apt-get update \
		&& apt-get install mariadb-server mariadb-client dumb-init -y \
		&& chmod 111 /tmp/setup_db.sh \
		&& mv /tmp/my.cnf /etc/mysql/my.cnf \
		&& chmod 0444 /etc/mysql/my.cnf

#RUN		chmod +x /tmp/setup_db.sh

#RUN		/tmp/setup_db.sh
#ENTRYPOINT 	["/usr/bin/dumb-init"]

EXPOSE		3306

CMD		["bash", "/tmp/setup_db.sh"]
