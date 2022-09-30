all:
	sudo mkdir -p /home/ndormoy/data/mariadb
	sudo mkdir -p /home/ndormoy/data/wordpress
	sudo chown 777 /home/ndormoy/data/wordpress
	sudo chown 777 /home/ndormoy/data/mariadb
	sudo docker compose -f srcs/docker-compose.yml up -d
clean:
	cd srcs ; sudo docker compose down -v --rmi all
	sudo rm -rf /home/ndormoy/data

fclean: 
	sudo docker system prune -af
re:
	clean fclean all

mini:
	sudo docker volume rm maria-volume wordpress-volume	
	sudo docker image rm nginx mariadb wordpress
