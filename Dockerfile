# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emurky <emurky@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 07:46:09 by emurky            #+#    #+#              #
#    Updated: 2021/03/07 11:03:00 by emurky           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

WORKDIR		/var/www/ft_server

ENV			AUTOINDEX="on"

RUN			apt-get update && apt-get install -y \
			wget \
			nginx \
			default-mysql-server \
			php-fpm php-mysql php-mbstring \
			openssl \
			wordpress && \
			rm -rf /var/lib/apt/lists/*

#			phpMyAdmin
RUN			mkdir phpmyadmin && \
			wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-english.tar.xz && \
			tar -xf phpMyAdmin-4.9.7-english.tar.xz --strip-components=1 -C /var/www/ft_server/phpmyadmin && \
			rm phpMyAdmin-4.9.7-english.tar.xz
COPY		srcs/config.inc.php /var/www/ft_server/phpmyadmin

#			WordPress
RUN			mv /usr/share/wordpress /var/www/ft_server
COPY		srcs/wp-config.php /var/www/ft_server/wordpress

#			nginx
COPY		srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN			rm /etc/nginx/sites-enabled/default && \
			ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#			SSL certificate
RUN			mkdir /etc/nginx/ssl && chmod 700 /etc/nginx/ssl && \
			openssl req	-x509 \
						-days 21 -nodes \
						-newkey rsa:2048 \
						-keyout /etc/nginx/ssl/ssl.key \
						-out /etc/nginx/ssl/ssl.crt \
						-subj "/C=RU/ST=Moscow/L=Moscow/O=21school/OU=student/\
						emailAddress=emurky@student.21-school.ru/CN=ft_server.com";


COPY		srcs/start.sh /usr/local/bin
COPY		srcs/autoindex.sh /usr/local/bin

CMD			[ "bash", "start.sh" ]

