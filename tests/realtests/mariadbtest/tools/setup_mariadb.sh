#!/bin/sh

mysql --execute "CREATE DATABASE ${MYSQL_DATABASE};"
mysql --execute "USE ${MYSQL_DATABASE};"
mysql --execute "CREATE USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql --execute "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_ROOT_USER}'@'localhost';"
mysql --execute "FLUSH PRIVILEGES;"
mysql --execute "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --execute "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_USER}';"
mysql --execute "FLUSH PRIVILEGES;"