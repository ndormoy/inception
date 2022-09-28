#!/bin/sh

#############################
## On telecharge wordpress ##
#############################
wp core download --path="${MYWP_PATH}" --allow-root

#######################################
## On creer un nouveau wp-config.php ##
#######################################
wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --dbhost="${MYWP_HOST}" --config-file="/var/www/html/wp-config.php" --skip-check --allow-root

###########################
## On installe wordpress ##
###########################
wp core install \
	--url="${DOMAIN_NAME}" \
	--title="nono" \
	--admin_user="${MYWP_ADMIN_USER}" \
	--admin_password="${MYWP_ADMIN_PASSWORD}" \
	--admin_email="${MYWP_ADMIN_EMAIL}" \
	--allow-root \

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
php-fpm7.3 -F