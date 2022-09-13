#!/bin/sh

###############################################################
## A FAIRE : Il faut verifier si on a deja une base de donne ##
## si oui, on peut passer directement a la derniere commande ##
###############################################################


##########################################################
## Lancer en arriere plan mysqld (server) pour pouvoir  ##
## executer des commandes mysql (client)                ##
##########################################################
mysqld &

#################################################
## On regarde si mysqld (le serveur) est lance ##
## si oui, on continue le programmme           ##
#################################################
while ! (mysqladmin ping)
do
   sleep 3
   echo "waiting for mysql server"
done
echo "starting the script"

#############################################
## A enlever une fois qu'on ajoute le .env ##
#############################################
export MYSQL_DATABASE=wordpress
export MYSQL_ROOT_USER=root
export MYSQL_ROOT_PASSWORD=rootpouet
export MYSQL_USER=ndormoy
export MYSQL_PASSWORD=poulet

##################################################
## Creation de database et user mysql (mariadb) ##
##################################################
mysql --execute "CREATE DATABASE ${MYSQL_DATABASE};"
mysql --execute "CREATE USER '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql --execute "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_ROOT_USER}'@'%';"
mysql --execute "FLUSH PRIVILEGES;"
mysql --execute "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --execute "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}. * TO '${MYSQL_USER}';"
mysql --execute "FLUSH PRIVILEGES;"

mysqladmin -u root -pSomePass shutdown

exec mysqld
