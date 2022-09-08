###############################################
## La version de laquelle on part pour build ##
###############################################
FROM debian:buster

#######################
## Installer mariadb ##
#######################
RUN apt-get update \
	&& apt-get install -y \
	mariadb-client \
	mariadb-server

###################################################
## Copier le fichier de configuration de mariadb ##
###################################################
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

##################################################
## On utilise le port 3306 qui va faire le lien ##
## entre Wordpress et mariadb                   ##
##################################################
EXPOSE 3306

#####################################################
## Commande a executer quand le container se lance ##
#####################################################
CMD ["setup_mariadb.sh"]