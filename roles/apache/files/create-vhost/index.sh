#!/bin/sh
#### Choix de l'Utilisateur du vhost par défaut ####
USERVHOST="www-data"

echo "----- $USERVHOST ----"

DOMAIN=$1
DOMAINsansEXT=`echo $DOMAIN | sed 's/\..\{1,3\}$//'`
######choix 1 vhosts classic, on verifie si le vhost existe#######
		if [ ! -e /var/www/vhosts/$DOMAIN ]
			then
			echo "==== Création des Répertoires ===="
			mkdir -p /var/www/vhosts/$DOMAIN/httpdocs/web
			mkdir -p /var/www/vhosts/$DOMAIN/log
			chown -R www-data:www-data /var/www/vhosts/
			### on verifie si le fichier de conf existe###
     	echo "==== Activation du vhost ===="
    	a2ensite $DOMAIN
      #####reload d'apache
    	echo "==== Reload Apache2 ===="
    	apache2ctl -k graceful
			####generation de la configuration
			. /opt/create-vhost/create-vhost-conf.sh
			#####activation du vhost######
				echo "==== Activation du vhost ===="
				a2ensite $DOMAIN
				#####reload d'apache
				echo "==== Reload Apache2 ===="
				apache2ctl -k graceful

			echo "==== Création d'un fichier info.php ===="
			chown -R www-data:www-data /var/www/vhosts/$DOMAIN/httpdocs/web/
    else
      echo "Fail !"
fi
echo
echo "============================="
exit
