#!/bin/sh

#############################################
## A enlever une fois qu'on ajoute le .env ##
#############################################
export MYSQL_DATABASE=wordpress
export MYSQL_ROOT_USER=root
export MYSQL_ROOT_PASSWORD=rootpouet
export MYSQL_USER=ndormoy
export MYSQL_PASSWORD=poulet

export MYWP_ADMIN_USER=adminndormoy
export MYWP_ADMIN_PASSWORD=adminpouleto
export MYWP_ADMIN_EMAIL=ndormoy@student.42.fr
export MYWP_USER=ndormoy
export MYWP_USER_PASSWORD=pouleto
export MYWP_USER_EMAIL=testo@student.42.fr
export MYWP_HOST=mariadb
export MYWP_PATH=/var/www/html/

while ! (mysqladmin ping)
  do
     sleep 3
     echo "waiting for mysql server"
  done
  echo "starting the script"

#############################
## On telecharge wordpress ##
#############################
wp core download --allow-root

#######################################
## On creer un nouveau wp-config.php ##
#######################################
wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --skip-check --allow-root

###########################
## On installe wordpress ##
###########################
#wp db create
wp core install \
	--url="${DOMAIN_NAME}" \
	--title="nono" \
	--admin_user="${MYWP_ADMIN_USER}" \
	--admin_password="${MYWP_ADMIN_PASSWORD}" \
	--admin_email="${MYWP_ADMIN_EMAIL}" \
	--path="${MYWP_PATH}" \
	--allow-root

################################
## On creer un User wordpress ##
################################
wp user create "${MYWP_USER}" "${MYWP_USER_EMAIL}" \
	--role=author \
	--user_pass="${MYWP_USER_PASSWORD}" \
	--allow-root

######################################################
## On creer le dossier qui doit exister pour lancer ##
## la commande d'en dessous                         ##
######################################################
mkdir -p /run/php/php7.3

########################################################
# On lance php-fpm qui est le FastCGI Process Manager ##
########################################################
php-fmp7.3 -F