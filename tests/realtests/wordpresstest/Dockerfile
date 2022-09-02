###############################################
## La version de laquelle on part pour build ##
###############################################
FROM debian:buster

################################
## Installer Wordpress et etc ##
################################
RUN apt-get update \
	&& apt-get install -y \
	php-cgi \
	php-common \
	php-fpm \
	php-pear \
	php-mbstring \
	php-zip \
	php-net-socket \
	php-gd \
	php-xml-util \
	php-mysql \
	php-bcmath \
	unzip \
	wget

##################################################
## On utilise le port 9000 qui va faire le lien ##
## entre NGINX et Wordpress                     ##
##################################################
EXPOSE 9000

#####################################################
## Commande a executer quand le container se lance ##
#####################################################
CMD ["sh", "tools/wordpress.sh"]