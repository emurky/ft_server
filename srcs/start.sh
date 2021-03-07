service mysql start
mysql -u root --skip_password <<-EOF
	CREATE USER 'emurky'@'localhost';
	CREATE DATABASE wordpress;
	GRANT ALL PRIVILEGES ON wordpress.* TO 'emurky'@'localhost';
	FLUSH PRIVILEGES;
EOF

service php7.3-fpm start
service nginx start

bash
