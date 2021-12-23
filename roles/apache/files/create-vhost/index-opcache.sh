#!/bin/sh
#### Choix de l'Utilisateur du vhost par défaut ####
USERVHOST="www-data"

echo "----- OpCache ----"

DOMAIN=opcache-vhost
DOMAINsansEXT=opcache-vhost

			####generation de la configuration
			. /opt/create-vhost/create-vhost-opcache-conf.sh
			#####activation du vhost######
				echo "==== Activation du vhost ===="
				a2ensite $DOMAIN
				#####reload d'apache
				echo "==== Reload Apache2 ===="
				apache2ctl -k graceful

echo
echo "============================="
exit
