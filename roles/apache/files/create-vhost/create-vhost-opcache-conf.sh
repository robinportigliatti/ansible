#!/bin/bash

echo "--Création du fichier de conf--"
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$DOMAIN.conf
echo "  ServerName opcache.localhost" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  DocumentRoot /usr/lib/nagios/www"  >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  DirectoryIndex check_opcache.php"  >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  <Directory />"  >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          Options FollowSymLinks" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          AllowOverride None" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  </Directory>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  <Directory \"/usr/lib/cgi-bin\">" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          AllowOverride None" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          Order allow,deny" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          Allow from all" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "   </Directory>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  ErrorLog /usr/lib/nagios/www/log/error.log" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  LogLevel warn" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  CustomLog /usr/lib/nagios/www/log/access.log combined" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  <Directory "/usr/lib/nagios/www">" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          AllowOverride None" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          Require host address" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          Require ip 127.0.0.1" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  </Directory>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  <Directory /usr/lib/nagios/www>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  <IfModule mod_php5.c>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          php_admin_value open_basedir \"/var/www/lib:/usr/lib/nagios/www:/tmp:/uploads\" " >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  </IfModule>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo " </Directory>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/$DOMAIN.conf
