#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "Provisioning virtual machine..."

echo "Actualizando lista de paquetes"
apt-get update

echo "Instalando Git"
apt-get install git -y

echo "Instalando Nginx"
apt-get install nginx -y

echo "Instalando PHP..."
apt-get install php-common php-cli php-fpm -y

echo "Instalando extensiones PHP..."
apt-get install curl php-curl php-gd php-mysql -y

echo "Configurando Nginx.."
cp /var/www/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default
service nginx restart

echo "Instalando MySQL..."
apt-get install debconf-utils -y
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
apt-get install mysql-server -y

