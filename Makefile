up:
	sudo mkdir -p /home/ndormoy/data/mariadb
	sudo mkdir -p /home/ndormoy/data/wordpress
	sudo chown 777 /home/ndormoy/data/wordpress
	sudo chown 777 /home/ndormoy/data/mariadb
	sudo docker compose -f srcs/docker-compose.yml up -d
clean:
	sudo docker stop nginx_container mariadb_container wordpress_container
	sudo docker rm nginx_container mariadb_container wordpress_container
	sudo docker image rm nginx mariadb wordpress
	sudo docker volume rm maria-volume wordpress-volume
	sudo rm -rf /home/nono/data

destroy:
	sudo docker system prune -af

mini:
	sudo docker volume rm maria-volume wordpress-volume	
	sudo docker image rm nginx mariadb wordpress
	
