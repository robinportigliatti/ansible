#!/bin/bash
x=0
DOMAIN=$1

echo ""
echo "${C_BLEU}Mise en place d'un htaccess ?${C_RESET}"
echo "${C_VERT} (1) ${C_RESET}oui"
echo "${C_VERT} (2) ${C_RESET}non"
while [ $x -ne 1 ] 
do
  read repht
  case $repht in
        1) echo "création du fichier .htaccess"
        cp -Ra SOURCES/.htaccess /var/www/vhosts/$DOMAIN/httpdocs/web/.htaccess
	cp -Ra SOURCES/.htpasswd /var/www/vhosts/$DOMAIN/httpdocs/.htpasswd
	sed "s/DOMAINE/$DOMAIN/g" SOURCES/.htaccess > /var/www/vhosts/$DOMAIN/httpdocs/web/.htaccess
	 ########## Renseignement du fichier texte ##############
         echo "-----------------" >>CONF/$1.txt
         echo "Authentification Htacess : highco / blrcm " >>CONF/$1.txt
	;;                	
	2) echo "Pas de htaccess"
	x=1
        ;;
	 *) echo "${C_RED}je ne comprend pas ce choix?!${C_RESET}"
        ;;
        esac
	   x=1
done

