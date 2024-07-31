#!/bin/bash

# Update package list
apt update

# Install Apache2
apt install -y apache2

# Create a simple HTML file
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Hallo!</title>
</head>
<body>
    <h1>Dies ist ein Test server!</h1>
</body>
</html>


