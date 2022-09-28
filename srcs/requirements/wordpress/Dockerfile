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
	php7.3-cli \
	php-cgi \
	php-common \
	php7.3-fpm \
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
	curl \
	mariadb-client

###############################################################################
## Installer wp-cli qui permet de faciliter l'installation de wordpress      ##
## (et le configurer, ce qui permet de lancer wp dans le script .sh sans pb) ##
###############################################################################
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

################################################################
## Copier le fichier de configuration fpm dans le bon dossier ##
################################################################
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

###############################################
## Copier notre wordpress.sh dans le workdir ##
###############################################
RUN mkdir -p /var/www/html
COPY tools/wordpress.sh /var/www/html/
RUN chmod 777 /var/www/html/wordpress.sh

#######################
## Working directory ##
#######################
WORKDIR /var/www/html

##################################################
## On utilise le port 9000 qui va faire le lien ##
## entre NGINX et Wordpress                     ##
##################################################
#EXPOSE 9000

#####################################################
## Commande a executer quand le container se lance ##
#####################################################
CMD ["sh", "/var/www/html/wordpress.sh"]