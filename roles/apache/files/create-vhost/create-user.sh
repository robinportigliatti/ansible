#/bin/bash
echo "Nom de l'Utilisateur"
read nom

passftp="`< /dev/urandom tr -dc _A-Z_a-z_0-9 | head -c8`"
echo $passftp
useradd -N -g www-data -m -s /bin/bash -d /var/www -p $(mkpasswd -H md5 "$passftp") $nom
echo $passftp
cat /etc/passwd | grep $nom
