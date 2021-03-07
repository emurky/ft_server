FROM		debian:buster

WORKDIR		/var/www/ft_server

RUN			apt-get update && apt-get install -y \
			wget \
			nginx \
			default-mysql-server \
			php-fpm php-mysql php-mbstring\
			wordpress && \
			rm -rf /var/lib/apt/lists/*

#			phpMyAdmin
RUN			mkdir phpmyadmin \
			wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.xz && \
			tar -xf phpMyAdmin-5.1.0-english.tar.xz --strip-components=1 -C /var/www/ft_server/phpmyadmin && \
			rm phpMyAdmin-5.1.0-english.tar.xz

COPY		srcs/config.inc.php /var/www/ft_server/phpmyadmin

#			WordPress
RUN			mv /usr/share/wordpress /var/www/ft_server

COPY		srcs/wp-config.php /var/www/ft_server/wordpress



