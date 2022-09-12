###############################################
## La version de laquelle on part pour build ##
###############################################
FROM debian:buster

#######################
## Installer mariadb ##
#######################
RUN apt-get update -y \
	&& apt-get install -y \
	mariadb-client \
	mariadb-server

###########################################################
## Creer le dossier mysqld et lui donner les droits pour ##
## pouvoir lancer sqld correctement sinon erreur 2002    ##
###########################################################
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql

##########################################################
## Lancer en arriere plan mysqld (server) pour pouvoir  ##
## executer des commandes mysql (client)                ##
##########################################################
RUN mysqld &

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