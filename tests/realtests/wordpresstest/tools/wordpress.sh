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

###########################
## On installe wordpress ##
###########################
wp core install \
	--url="ndormoy.42.fr" \
	--title="noe" \
	--admin_user="" \
	--admin_email="" \
	--path="/var/www/html/" \
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