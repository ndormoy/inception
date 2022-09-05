###############################################
## La version de laquelle on part pour build ##
###############################################
FROM debian:buster

################################
## Installer Wordpress et etc ##
################################
RUN apt-get update \
	&& apt-get install -y \
	php7.3 \
	php7.3-mysql \
	php-cli \
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
	wget \
	curl

###############################################################################
## Installer wp-cli qui permet de faciliter l'installation de wordpress      ##
## (et le configurer, ce qui permet de lancer wp dans le script .sh sans pb) ##
###############################################################################
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


#######################
## Working directory ##
#######################
WORKDIR /var/www/html

##################################################
## On utilise le port 9000 qui va faire le lien ##
## entre NGINX et Wordpress                     ##
##################################################
EXPOSE 9000

#####################################################
## Commande a executer quand le container se lance ##
#####################################################
CMD ["sh", "tools/wordpress.sh"]