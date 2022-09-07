#!/bin/sh

#########################################
# Premiere maniere d'installer wordpress#
#########################################
# wget https://fr.wordpress.org/wordpress-6.0.2-fr_FR.zip
# unzip wordpress-6.0.2-fr_FR.zip
# rm -rf wordpress-6.0.2-fr_FR.zip
# Puis remplacer les variables dans le fichier wp-config-sample.php

#######################################################################
# Deuxieme maniere plus pratique avec wp-cli, il faut d'abord l'avoir##
# installe avant sinon la commande wp n'existe pas.####################
#######################################################################

#############################
## On telecharge wordpress ##
#############################
wp core download --allow-root

#######################################
## On creer un nouveau wp-config.php ##
#######################################
wp config create --dbname="${MY_SQL_DATA_BASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --skip-check

###########################
## On installe wordpress ##
###########################
#wp db create
wp core install \
	--url="${DOMAIN_NAME}" \
	--title="nono" \
	--admin_user="${MYWP_ADMIN_USER}" \
	--admin_email="${MYWP_ADMIN_EMAIL}" \
	--path="${MYWP_PATH}" \
	--allow-root

################################
## On creer un User wordpress ##
################################
wp user create noe ndormoy@student.42.fr \
	--role=author \
	--allow-root

########################################################
# On lance php-fpm qui est le FastCGI Process Manager ##
########################################################
php-fmp -F