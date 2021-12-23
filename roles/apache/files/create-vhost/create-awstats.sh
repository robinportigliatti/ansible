#!/bin/bash
x=0
DOMAIN=$1

echo ""
echo "${C_BLEU}Mise en place de Statistique Awstats ?${C_RESET}"
echo "${C_VERT} (1) ${C_RESET}oui"
echo "${C_VERT} (2) ${C_RESET}non"
while [ $x -ne 1 ] 
do
  read repaw
  case $repaw in
        1) echo "création du fichier de conf awstats"
	sed "s/DOMAINE/$DOMAIN/g" SOURCES/awstats.conf > /etc/awstats/awstats.$DOMAIN.conf
	/usr/lib/cgi-bin/awstats.pl -config=$DOMAIN -update
	########## Renseignement du fichier texte ##############
        echo "-----------------" >>CONF/$1.txt
        echo "AWSTATS : http://$DOMAIN/cgi-bin/awstats.pl?config=$DOMAIN " >>CONF/$1.txt
        ;;                	
	2) echo "Pas de statistiques"
	x=1
        ;;
	 *) echo "${C_RED}je ne comprend pas ce choix?!${C_RESET}"
        ;;
        esac
		echo "${C_VERT}(3)${C_RESET} pour sortir"
	   x=1
done
