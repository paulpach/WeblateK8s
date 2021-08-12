#!/bin/bash

read -e -p "Enter smtp server (smtp.sendgrid.net): " host
host=${host:-smtp.sendgrid.net}
read -e -p "Enter port (587): " port
read -e -p "Server email: " serveremail
port=${port:-587}
read -e -p "Enter username: " username
read -s -p "Enter password: " password
echo

echo "host $host"
echo "port $port"
echo "username $username"
echo "server email $serveremail"

kubectl delete secret email

kubectl create secret generic email \
    --from-literal=WEBLATE_EMAIL_USER="$username" \
    --from-literal=WEBLATE_EMAIL_HOST="$host" \
    --from-literal=WEBLATE_EMAIL_PORT="$port" \
    --from-literal=WEBLATE_EMAIL_PASSWORD="$password" \
    --from-literal=WEBLATE_SERVER_EMAIL="$serveremail" \
    --from-literal=WEBLATE_DEFAULT_FROM_EMAIL="$serveremail" \
    --from-literal=WEBLATE_EMAIL_USE_SSL=True \
    --from-literal=WEBLATE_EMAIL_USE_TLS=False
    
