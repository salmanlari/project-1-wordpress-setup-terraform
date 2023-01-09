    #!/bin/bash
    sudo apt update -y
    sudo apt install nginx -y
    sudo apt install awscli -y
    sudo apt install php-fpm php-mysql -y
    cd /var/www/html
    sudo wget http://wordpress.org/latest.tar.gz
    sudo tar -xzvf latest.tar.gz
    hostnamectl set-hostname wp-server-1