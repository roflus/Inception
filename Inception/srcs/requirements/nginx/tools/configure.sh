#!/bin/bash

if [ ! -f "/etc/ssl/certs/certificate.crt" ]; then
    echo "Creating certificate"
    openssl req -new \
            -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 365  \
            -nodes \
            -out /etc/ssl/certs/certificate.crt \
            -keyout /etc/ssl/private/certificate.key \
            -subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_LOCALITY/O=$SSL_ORGANISATION/CN=$DOMAIN_NAME/"
else
    echo "Certificate is already created"
fi

exec "$@"