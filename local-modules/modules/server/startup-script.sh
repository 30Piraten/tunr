!#/bin/bash

apt-get update && apt-get upgrade
apt install -y apache2
echo "Hello, World!" > /var/www/html/index.html