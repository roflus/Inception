#!bin/sh

if (! /run/mysqld) {
    mkdir -p /var/run/mysqld
    chown -R mysql:root /var/run/mysqld
}


echo "CREATE DATABASE IF IT DOES NOT EXISTS" 