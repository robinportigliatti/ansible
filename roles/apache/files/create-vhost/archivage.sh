#!/bin/sh

####couleurs <3####
. ./color.sh

#### Detect user root ###
if [ "$(id -u)" != "0" ]; then
   echo "${C_RED}Ce script doit être exécuté avec les droits ROOT ${C_RESET}" 1>&2
   exit 1
fi
#### Detect parametres ###
A=$(date '+%m'"_20"'%y')
if [ -z "$1" ] ; then
   echo "Vous n'avez pas passé de parametre" 
   echo "usage : ./archivage.sh NomDuVhost.fr"
   exit 1
fi
#### Archiver le vhost ? ####

DOMAIN=$1
DOMAINsansEXT=`echo $DOMAIN | sed 's/\..\{1,3\}$//'`

while :
do
echo "${C_BLEU}==== Voulez vous archiver $DOMAIN ? ====${C_RESET}"
echo "${C_VERT} (1) ${C_RESET}Oui"
echo "${C_VERT} (2) ${C_RESET}Non"
read rep
  case $rep in
	1)
	#####CREATION DU REP ARCHIVES#######
	if [ ! -e /var/www/vhosts/ARCHIVES ]
		then mkdir -p /var/www/vhosts/ARCHIVES
		echo ""
		echo "--création du repertoire ARCHIVES dans VHOSTS--"
	fi
	cheminSCRIPT=`pwd`
	if [ ! -e $cheminSCRIPT/ARCHIVE-CONF ]
		then mkdir -p $cheminSCRIPT/ARCHIVE-CONF
		echo ""
		echo "--création du repertoire ARCHIVE-CONF dans $cheminSCRIPT--"
	fi
	echo " --- Archivage de $DOMAIN ---"
	echo " ===============================" >> ARCHIVE-CONF/$DOMAIN.txt
	echo "USERVHOST : "`ls -l /var/www/vhosts/ | grep $DOMAIN | awk '{ print $3}'` >> ARCHIVE-CONF/$DOMAIN.txt
	echo "ARCHIVE NON TGZ : " `du -h --max-depth=0 /var/www/vhosts/$DOMAIN | awk '{ print $1 }'` >> ARCHIVE-CONF/$DOMAIN.txt
	####### COPIE DE LA CONF DU VHOST ####
	echo ""
	echo "--- Copie du fichier de conf ---"
	cp -p /etc/apache2/sites-available/$DOMAIN /var/www/vhosts/$DOMAIN/
	####### DUMP DE LA BDD #############################
	if [ -e CONF/$DOMAIN.txt ]
		then
		BDD=`cat CONF/$DOMAIN.txt | grep '^BDD' | awk '{ print $3 }'`
		mysqldump --defaults-extra-file=/etc/mysql/debian.cnf $BDD > /var/www/vhosts/$DOMAIN/$DOMAINsansEXT.sql
		echo " ==================" >> ARCHIVE-CONF/$DOMAIN.txt
		echo "Dump de la BDD fait le `date +%F`"  >> ARCHIVE-CONF/$DOMAIN.txt
		echo " ==================" >> ARCHIVE-CONF/$DOMAIN.txt
		else
		echo " PAS DE FICHIER .TXT --> Il faut faire le Dump BDD à la main"
	fi
	####### COPIE DU FICHIER DE CONF AWSTAT #############
	if [ -e /etc/awstats/awstats.$DOMAIN.conf ]
		then 
		echo " Fichier de conf AWSTAT copié " >> ARCHIVE-CONF/$DOMAIN.txt
		cp /etc/awstats/awstats.$DOMAIN.conf /var/www/vhosts/$DOMAIN/awstats.$DOMAIN.conf
	fi
	#######COMPRESSION ET ARCHIVAGE DU VHOSTS############
	echo ""
	echo "--- Compression de l'archive ---"
	cd /var/www/vhosts
	tar czf ARCHIVES/$DOMAIN.tgz $DOMAIN
	cd $cheminSCRIPT
	echo  "ARCHIVE TGZ : " `ls -lh /var/www/vhosts/ARCHIVES/$DOMAIN.tgz |  awk '{ print $5}'` >> ARCHIVE-CONF/$DOMAIN.txt
	echo ""
	echo " --- Création du fichier $DOMAIN.txt dans ARCHIVE-CONF ---"
	echo " ==================" >> ARCHIVE-CONF/$DOMAIN.txt
	echo " --- INFO VHOST ---" >> ARCHIVE-CONF/$DOMAIN.txt
	more CONF/$DOMAIN.txt >> ARCHIVE-CONF/$DOMAIN.txt
	
	break
	;;
	2)echo "${C_VERT}Fin du script${C_RESET}"
	break
	;;
	*)
	echo "${C_RED}Mauvaise Réponse...${C_RESET}"
	;;
	esac

done

echo "${C_VERT} Apres avoir vérifier que l'archivage c'est bien déroulé, on peut supprimer le vhost et la bdd avec ./remove...${C_RESET}"
echo "${C_BLEU}=============================${C_RESET}"

