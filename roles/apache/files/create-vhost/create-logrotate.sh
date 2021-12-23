#!/bin/sh
echo "----- Logrotate initialization ----"
			### Création du logrotate correspondant
			cp -Ra /etc/logrotate.d/apache2 /etc/logrotate.d/apache2-$DOMAIN
      sed -i "s/\/var\/log\/apache2\//\/var\/www\/vhosts\/$DOMAIN\/log\//g" /etc/logrotate.d/apache2-$DOMAIN
echo
echo "============================="
exit
