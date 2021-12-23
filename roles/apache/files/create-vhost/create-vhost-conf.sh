#!/bin/bash

echo "--Création du fichier de conf--"
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$DOMAIN.conf
echo "  ServerName $DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  ServerAlias www.$DOMAIN $DOMAINsansEXT.hcdata.fr"  >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  DocumentRoot /var/www/vhosts/$DOMAIN/httpdocs/web"  >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  DirectoryIndex index.php"  >> /etc/apache2/sites-available/$DOMAIN.conf
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
echo "  ErrorLog /var/www/vhosts/$DOMAIN/log/error.log" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  LogLevel warn" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  CustomLog /var/www/vhosts/$DOMAIN/log/access.log combined" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  <Directory "/var/www/vhosts/$DOMAIN/httpdocs/">" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          AllowOverride All" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          Allow from All" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  </Directory>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  <Directory /var/www/vhosts/$DOMAIN/httpdocs>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  <IfModule mod_php5.c>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "          php_admin_value open_basedir \"/var/www/lib:/var/www/vhosts/$DOMAIN/httpdocs:/tmp:/uploads\" " >> /etc/apache2/sites-available/$DOMAIN.conf
echo "  </IfModule>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo " </Directory>" >> /etc/apache2/sites-available/$DOMAIN.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/$DOMAIN.conf
