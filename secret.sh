#!/bin/bash

read -p "Enter name: " username
read -s -p "Enter password: " password
read -p "Enter email: " email

kubectl create secret generic admin \
    --from-literal=EMAIL="$email" \
    --from-literal=NAME="$username" \
    --from-literal=PASSWORD="$password" \
    
