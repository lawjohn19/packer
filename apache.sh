#!/bin/bash

sleep 30

#update repo
sudo apt update -y

#install apache 
sudo apt install apache2 -y

sudo systemctl start apache2
sudo systemctl enable apache2



