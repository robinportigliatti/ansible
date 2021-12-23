#!/bin/sh

DOMAIN=$1

echo "Suppression du vhost $DOMAIN: êtes vous sur ? oui (1) , non (2)"
USERVHOST=`find /var/www/vhosts -name $DOMAIN -printf %u`
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
        1)
                echo "suppression de $DOMAIN"
		rm -rf /var/www/vhosts/$DOMAIN
		a2dissite $DOMAIN
		if [ -e /etc/apache2/sites-enables/$DOMAIN ]
			then rm /etc/apache2/sites-enables/$DOMAIN
		fi
		apache2ctl -k graceful
		rm /etc/apache2/sites-available/$DOMAIN
		echo "Domaine supprimé"
		echo "${C_BLEU}Suppression de la BDD?${C_RESET}"
                echo "${C_VERT} (1) ${C_RESET}oui"
                echo "${C_VERT} (2) ${C_RESET}non"
		read -p "réponse :" rep
                case $rep in
		1)
		echo ""
		echo "BDD :"`cat CONF/$DOMAIN.txt | grep '^BDD' | awk '{ print $3 }'`
		echo "" 
		echo "Reecrire le nom de la BDD A supprimer (SANS bd)"
		read word
		bdd=$word'bd'
		mysql --defaults-extra-file=/etc/mysql/debian.cnf -e "DROP DATABASE $bdd ;"
		userbdd=$word'bdu'
		mysql --defaults-extra-file=/etc/mysql/debian.cnf -e "DROP USER $userbdd@localhost ;"
		rm $word.txt
		;;
		2) echo "pas de suppression BDD"
		;;
		esac
		#----ftp
		echo "${C_BLEU}Suppression du user ftp ?${C_RESET}"
                echo "${C_VERT} (1) ${C_RESET}oui"
                echo "${C_VERT} (2) ${C_RESET}non"
                read -p "réponse :" rep
                case $rep in
                1)
		echo ""
                echo "USER : $USERVHOST"
		echo "" 
		echo "Reecrire le Nom du user ftp à supprimer (si bleuroy/highco/root/www-data ecrire aucun)"
		read nom
		if [ $nom == aucun ]
		then
		echo "on ne supprime pas $nom"
		else
		deluser $nom
		fi
                ;;
                2)echo "pas de suppression user ftp"
                ;;
                esac
		#----rep symfony
                echo "${C_BLEU}Suppression des rep symfony?${C_RESET}"
                echo "${C_VERT} (1) ${C_RESET}oui"
                echo "${C_VERT} (2) ${C_RESET}non"
                read -p "réponse :" rep
                case $rep in
                1)rm -rf /var/www/lib/symf*
                ;;
                2)echo "pas de suppression symfony"
                ;;
                esac
		
		#----awstat txt
                echo "${C_BLEU}Suppression de la conf awstat ?${C_RESET}"
                echo "${C_VERT} (1) ${C_RESET}oui"
                echo "${C_VERT} (2) ${C_RESET}non"
                read -p "réponse :" rep
                case $rep in
                1)rm -f /etc/awstats/awstats.$DOMAIN.conf
                ;;
                2)echo "pas de suppression de la conf awstat"
                ;;
                esac

		
		#----Suppression txt
                echo "${C_BLEU}Suppression du conf.txt ?${C_RESET}"
                echo "${C_VERT} (1) ${C_RESET}oui"
                echo "${C_VERT} (2) ${C_RESET}non"
                read -p "réponse :" rep
                case $rep in
                1)rm -f CONF/$DOMAIN.txt
                ;;
                2)echo "pas de suppression du fichier conf.txt"
                ;;
                esac
		exit

	;;
        2)
                echo "Annulation!!"
                break
                ;;
        *)
                echo "Ceci n'est pas un choix!"
                ;;
  esac
done

echo 
echo "merci."
exit
