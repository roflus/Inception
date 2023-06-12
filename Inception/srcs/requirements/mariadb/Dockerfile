FROM debian:buster

RUN apt-get update; apt install -y mariadb-server

COPY tools/configure.sh /usr/bin/

ENTRYPOINT ["bash", "tools/configure.sh"]