#!/bin/sh

#############################
## On telecharge wordpress ##
#############################
wp core download --allow-root

#######################################
## On creer un nouveau wp-config.php ##
#######################################
wp config create --dbname="${MY_SQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --skip-check

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

########################################################
# On lance php-fpm qui est le FastCGI Process Manager ##
########################################################
php-fmp -F