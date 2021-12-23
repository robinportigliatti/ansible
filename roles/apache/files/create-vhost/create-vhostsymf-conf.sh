#!/bin/bash

echo "--Création du fichier de conf--"
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$DOMAIN
echo "  ServerName $DOMAIN" >> /etc/apache2/sites-available/$DOMAIN
echo "  ServerAlias www.$DOMAIN $DOMAINsansEXT.hcdata.fr"  >> /etc/apache2/sites-available/$DOMAIN
echo "  DocumentRoot /var/www/vhosts/$DOMAIN/httpdocs/web"  >> /etc/apache2/sites-available/$DOMAIN
echo "  DirectoryIndex index.php"  >> /etc/apache2/sites-available/$DOMAIN
echo "  <Directory />"  >> /etc/apache2/sites-available/$DOMAIN
echo "          Options FollowSymLinks" >> /etc/apache2/sites-available/$DOMAIN          
echo "          AllowOverride None" >> /etc/apache2/sites-available/$DOMAIN
echo "  </Directory>" >> /etc/apache2/sites-available/$DOMAIN
echo "  ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" >> /etc/apache2/sites-available/$DOMAIN
echo "  <Directory \"/usr/lib/cgi-bin\">" >> /etc/apache2/sites-available/$DOMAIN
echo "          AllowOverride None" >> /etc/apache2/sites-available/$DOMAIN
echo "          Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch" >> /etc/apache2/sites-available/$DOMAIN
echo "          Order allow,deny" >> /etc/apache2/sites-available/$DOMAIN
echo "          Allow from all" >> /etc/apache2/sites-available/$DOMAIN
echo "   </Directory>" >> /etc/apache2/sites-available/$DOMAIN
echo "  ErrorLog /var/www/vhosts/$DOMAIN/log/error.log" >> /etc/apache2/sites-available/$DOMAIN
echo "  LogLevel warn" >> /etc/apache2/sites-available/$DOMAIN
echo "  CustomLog /var/www/vhosts/$DOMAIN/log/access.log combined" >> /etc/apache2/sites-available/$DOMAIN
echo "  <Directory "/var/www/vhosts/$DOMAIN/httpdocs/">" >> /etc/apache2/sites-available/$DOMAIN
echo "          AllowOverride All" >> /etc/apache2/sites-available/$DOMAIN
echo "          Allow from All" >> /etc/apache2/sites-available/$DOMAIN
echo "  </Directory>" >> /etc/apache2/sites-available/$DOMAIN
echo "   Alias /sf \"/var/www/lib/symfony-$symfony/data/web/sf\"" >> /etc/apache2/sites-available/$DOMAIN
echo "  <Directory \"/var/www/lib/symfony-$symfony/data/web/sf\">" >> /etc/apache2/sites-available/$DOMAIN
echo "   Allow from all" >> /etc/apache2/sites-available/$DOMAIN
echo "   AllowOverride All" >> /etc/apache2/sites-available/$DOMAIN
echo "  </Directory>" >> /etc/apache2/sites-available/$DOMAIN
echo "  <Directory /var/www/vhosts/$DOMAIN/httpdocs>" >> /etc/apache2/sites-available/$DOMAIN
echo "  <IfModule mod_php5.c>" >> /etc/apache2/sites-available/$DOMAIN
echo "          php_admin_value open_basedir \"/var/www/lib:/var/www/vhosts/$DOMAIN/httpdocs:/tmp\" " >> /etc/apache2/sites-available/$DOMAIN
echo "  </IfModule>" >> /etc/apache2/sites-available/$DOMAIN
echo " </Directory>" >> /etc/apache2/sites-available/$DOMAIN
echo "</VirtualHost>" >> /etc/apache2/sites-available/$DOMAIN

