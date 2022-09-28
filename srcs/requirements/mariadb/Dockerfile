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
RUN mkdir -p /var/run/mysqld/
RUN chmod -R 777 /run/mysqld/
RUN chmod -R 777 /var/lib/mysql/

###################################################
## Copier le fichier de configuration de mariadb ##
###################################################
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#######################################
## Copier le script setup_mariadb.sh ##
#######################################
COPY tools/setup_mariadb.sh /usr/
RUN chmod 777 /usr/setup_mariadb.sh

##################################################
## On utilise le port 3306 qui va faire le lien ##
## entre Wordpress et mariadb                   ##
##################################################
EXPOSE 3306

#####################################################
## Commande a executer quand le container se lance ##
#####################################################
CMD ["/usr/setup_mariadb.sh"]