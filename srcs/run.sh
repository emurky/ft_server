docker rmi -f ft_server_image
docker rm -f ft_server
# docker system prune -af

docker build -t ft_server_image .
docker run -it -p 80:80 -p 443:443 --name ft_server ft_server_image
