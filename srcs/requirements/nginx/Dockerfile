FROM			debian:buster


RUN			apt-get update \
			&& apt-get install dumb-init nginx -y

RUN			apt-get install openssl -y

RUN			openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
			-subj "/C=ES/ST=Spain/L=Madrid/O=School42/CN=aparolar.42.fr" \
			-keyout /etc/ssl/private/aparolar.key -out /etc/ssl/certs/aparolar.crt

COPY			conf/nginx.conf /etc/nginx/
COPY			conf/hosts /etc/

#ENTRYPOINT		["/usr/bin/dumb-init"]

EXPOSE			443

CMD			["nginx", "-g", "daemon off;"]
