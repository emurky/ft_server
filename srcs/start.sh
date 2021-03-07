service nginx start

service php7.3-fpm start

service mysql start
mysql -u root --skip_password <<-EOF
	CREATE USER 'emurky'@'localhost'
	CREATE DATABASE IF NOT EXISTS ft_server;
	GRANT ALL ON wordpress.* TO 'emurky'@'localhost';
	FLUSH PRIVILEGES;
EOF

bash
