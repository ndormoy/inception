###############################################
## La version de laquelle on part pour build ##
###############################################
FROM debian:buster

#########################################################
## Installer Nginx et opensslm et clean l'installation ##
#########################################################
RUN apt-get update \
	&& apt-get install -y --force-yes nginx \
	&& apt-get install -y openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/list/*

##################################
## Generer les certificates ssl ##
##################################
RUN openssl req -x509 \
	-nodes \
	-days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.pem \
	-subj "/C=FR/ST=paris/L=paris/O=42, /OU=ndormoy/CN=ndormoy.42.fr"

##########
## TEST ##
##########
# RUN mkdir /var/www/html/test

# COPY conf/index.html /var/www/html/test

#########################################
## Copier le ficher de conf dans nginx ##
#########################################
# COPY conf/nginx.conf /etc/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/

##################
## Le/Les ports ##
##################
#EXPOSE 80
EXPOSE 443

#####################################################
## Commande a executer quand le container se lance ##
#####################################################
CMD ["nginx", "-g", "daemon off;"]