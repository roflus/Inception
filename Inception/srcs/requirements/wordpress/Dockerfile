FROM debian:buster

RUN apt-get -y update; apt-get -y upgrade;

RUN apt install php-fpm -y; apt install curl -y

COPY tools/configure.sh /usr/bin/

ENTRYPOINT [ "bash", "configure.sh" ]
# CMD [ "executable" ]