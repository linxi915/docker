#!/bin/sh

# 最终证书存放的目录
FOLDER_DIR=certs/
# 证书文件名字，默认为空的话代表用输入domain作为证书文件名字
CERT_NAME=registry

# create self-signed server certificate:

read -p "Enter your domain [www.example.com]: " DOMAIN

echo "Create server key..."

if [ -z "$CERT_NAME" ]; then
    CERT_NAME=$DOMAIN
fi

openssl genrsa -des3 -out $CERT_NAME.key 1024

echo "Create server certificate signing request..."

SUBJECT="/C=CN/ST=BeiJing/L=Dongcheng/CN=$DOMAIN"

openssl req -new -subj $SUBJECT -key $CERT_NAME.key -out $CERT_NAME.csr

echo "Remove password..."

mv $CERT_NAME.key $CERT_NAME.origin.key
openssl rsa -in $CERT_NAME.origin.key -out $CERT_NAME.key

echo "Sign SSL certificate..."

openssl x509 -req -days 3650 -in $CERT_NAME.csr -signkey $CERT_NAME.key -out $CERT_NAME.crt

echo "TODO:"
echo "Copy $DOMAIN.crt to /etc/nginx/ssl/$DOMAIN.crt"
echo "Copy $DOMAIN.key to /etc/nginx/ssl/$DOMAIN.key"
echo "Add configuration in nginx:"
echo "server {"
echo "    ..."
echo "    listen 443 ssl;"
echo "    ssl_certificate     /etc/nginx/ssl/$DOMAIN.crt;"
echo "    ssl_certificate_key /etc/nginx/ssl/$DOMAIN.key;"
echo "}"

if [ -n "$FOLDER_DIR" ]; then
    mv $CERT_NAME.key $FOLDER_DIR
    mv $CERT_NAME.crt $FOLDER_DIR
    mv $CERT_NAME.csr $FOLDER_DIR
    mv $CERT_NAME.origin.key $FOLDER_DIR    
fi
