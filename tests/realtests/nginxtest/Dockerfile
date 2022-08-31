FROM debian:buster

RUN apt-get update \ 
	&& apt-get install -y --force-yes nginx \
	&& apt-get install openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/list/* /tmp/* /var/tmp*

#COPY conf/nginx.conf /etc/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 443 80


CMD ["nginx", "-g", "daemon off;"]