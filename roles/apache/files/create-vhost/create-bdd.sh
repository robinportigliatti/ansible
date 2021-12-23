#!/bin/bash
case $case in
                                1) echo "Entrez le nom de la base de donnée (8lettres +bd)"
                                read word
                                bdd=$word'bd'
                                userbdd=$word'bdu'
                                echo "CREATE DATABASE IF NOT EXISTS \`$bdd\`" | mysql --defaults-extra-file=/etc/mysql/debian.cnf -h localhost
                                passbdd="`< /dev/urandom tr -dc _A-Z_a-z_0-9 | head -c8`"
                                echo "GRANT ALL PRIVILEGES ON \`$bdd\`.* TO '$userbdd'@localhost IDENTIFIED BY '$passbdd';" | mysql --defaults-extra-file=/etc/mysql/debian.cnf -h localhost
                                cheminCONF=`pwd`
				if [ ! -e $cheminCONF/CONF ]
				then mkdir CONF
				fi
				echo "VHOST $1 sur `hostname`" > CONF/$1.txt
                                echo "BDD : $bdd" >> CONF/$1.txt
                                echo "USER-BDD : $userbdd" >> CONF/$1.txt
                                echo "PASS-BDD : $passbdd" >> CONF/$1.txt
                                ;;
                                2) echo "${C_PINK}- pas de base de données -${C_RESET}"
				echo "-----Pas de BDD-----" >> CONF/$1.txt
				break
				;;
                        esac 

