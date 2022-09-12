#!/bin/sh

##########################################################
## Lancer en arriere plan mysqld (server) pour pouvoir  ##
## executer des commandes mysql (client)                ##
##########################################################
mysqld &

while ! (mysqladmin ping)
do
   sleep 3
   echo "waiting for mysql ..."
done
echo "starting the main script"

mysql --execute "CREATE DATABASE ${MYSQL_DATABASE};"
#mysql --execute "USE ${MYSQL_DATABASE};"
mysql --execute "CREATE USER '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql --execute "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_ROOT_USER}'@'%';"
mysql --execute "FLUSH PRIVILEGES;"
mysql --execute "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --execute "GRANT ALL PRIVILEGES ON '${MYSQL_DATABASE}'. * TO '${MYSQL_USER}';"
mysql --execute "FLUSH PRIVILEGES;"

exec mysqld
