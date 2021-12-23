#!/bin/bash
x=0
echo ""
echo "${C_BLEU}Création d'un compte ftp dédié au vhost ?${C_RESET}"
echo "${C_VERT} (1) ${C_RESET}oui"
echo "${C_VERT} (2) ${C_RESET}non"
while [ $x -ne 1 ]
do
  read repftp
  case $repftp in
        1) echo "Entrez le nom du compte ftp"
           read userftp
           passftp="`< /dev/urandom tr -dc _A-Z_a-z_0-9 | head -c6`"
           ############# Vérifier Si le UserFtp existe déja #################
           if [ 0 = `grep "^$userftp:" /etc/passwd | wc -l` ]
                then
			echo "${C_PINK}- Création du compte $userftp -${C_RESET}"
			passftp="`< /dev/urandom tr -dc _A-Z_a-z_0-9 | head -c8`"
			useradd -N -M -g www-data -s /bin/false -d /var/www/vhosts/$1 -p $(mkpasswd -H md5 "$passftp") $userftp
			chown -R $userftp:www-data /var/www/vhosts/$1
			echo "------"
			cat /etc/passwd | grep $userftp
			echo "------"
			USERVHOST=$userftp
			x=1
	   	else
                 	echo "${C_BLEU}L'utilisateur $userftp existe déja, Faut-il le recréer ?"
                	echo "${C_VERT} (1) ${C_RESET}oui"
                	echo "${C_VERT} (2) ${C_RESET}non"
                	read -p "réponse :" repftpexiste
                	case $repftpexiste in
                        	1)  
				if [ $userftp == "root" ] || [ $userftp == "www-data" ] || [ $userftp == "bleuroy" ] || [ $userftp == "highco" ]
                        	then 
                          		echo "${C_VERT}On ne doit pas modifier $userftp !!!${C_RESET}"
			  		echo " (1) Changer le nom (2) sortir"
					
                        	else
			  		echo "ON RECREER USER $userftp"
					deluser $userftp
					passftp="`< /dev/urandom tr -dc _A-Z_a-z_0-9 | head -c8`"
                        		useradd -N -M -g www-data -s /bin/false -d /var/www/vhosts/$1 -p $(mkpasswd -H md5 "$passftp") $userftp
                        	        chown -R $userftp:www-data /var/www/vhosts/$1
                        		echo "------"
                        		cat /etc/passwd | grep "^$userftp:"
                        		echo "------"
                        		USERVHOST=$userftp
					x=1
                		fi
                        	;;
                        	2) echo "tant pis"
				x=1
                       	 	;;
                	esac
	    	fi
           ########## Renseignement du fichier texte ##############
           	echo "-----------------" >>CONF/$1.txt
           	echo "HOST : $1" >> CONF/$1.txt
           	echo "USER-FTP : $userftp" >> CONF/$1.txt
           	echo "PASS-FTP : $passftp" >> CONF/$1.txt
		x=1	
        ;;
        2) echo "pas de compte ftp"
	   x=1
	;;
	*) echo "${C_RED}je ne comprend pas ce choix?!${C_RESET}"
        ;;
esac
done
