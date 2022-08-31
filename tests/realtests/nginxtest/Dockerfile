FROM debian:buster

RUN apt-get update \ 
	&& apt-get install -y --force-yes nginx \
	&& apt-get install -y openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/list/* /tmp/* /var/tmp*

#COPY conf/nginx.conf /etc/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 443 80

RUN sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

CMD ["nginx", "-g", "daemon off;"]