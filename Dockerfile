FROM	debian:buster

RUN		apt-get update && apt-get install -y \
		nginx \
		&& rm -rf /var/lib/apt/lists/* \
FROM	debian:buster

RUN		apt-get update && apt-get install -y \
		nginx \
		&& rm -rf /var/lib/apt/lists/*

