#!/bin/bash

echo "Quel version de symfony ? (1.x.x ou 1.x.xx)"
read symfony
echo "$symfony"
chemin=`pwd`
cd /var/www/lib
wget http://www.symfony-project.org/get/symfony-$symfony.tgz
tar xzf symfony-$symfony.tgz
rm symfony-$symfony.tgz
cd $chemin


