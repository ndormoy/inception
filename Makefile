up:
	docker volume create --name wordpress-volume
	docker volume create --name maria-volume
	# docker-compose -f srcs/docker-compose.yml up -d
	docker compose -f srcs/docker-compose.yml up -d
clean:
	docker stop nginx_container mariadb_container wordpress_container
	docker rm nginx_container mariadb_container wordpress_container
	docker image rm nginx_image mariadb_image wordpress_image
	docker volume rm maria-volume wordpress-volume
