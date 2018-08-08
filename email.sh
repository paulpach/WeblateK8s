#!/bin/bash

read -p "Enter smtp server: " host
read -p "Enter username: " username
read -s -p "Enter password: " password

kubectl create secret generic email \
    --from-literal=WEBLATE_EMAIL_USER="$username" \
    --from-literal=WEBLATE_EMAIL_HOST="$host" \
    --from-literal=WEBLATE_EMAIL_PASSWORD="$password" \
    
