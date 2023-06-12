FROM debian:buster

EXPOSE 3306

RUN apt-get update; apt install -y mariadb-server

RUN mysql_install_db --user=mysql --datadir=/var/lib/msql
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

COPY tools/configure.sh /usr/bin/
RUN chmod +x /usr/bin/configure.sh

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld

ENTRYPOINT ["bash", "/usr/bin/configure.sh"]
CMD [ "mysqld_safe" ]