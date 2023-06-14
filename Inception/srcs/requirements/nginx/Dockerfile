FROM debian:buster

RUN apt-get -y update; apt-get install -y nginx openssl

RUN	mkdir -p /etc/nginx/ssl; mkdir -p /run/nginx

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365  \
    -nodes -out /etc/ssl/certs/certificate.crt -keyout /etc/ssl/private/certificate.key \ 
    -subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_LOCALITY/O=$SSL_ORGANISATION/CN=$DOMAIN_NAME/"

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
