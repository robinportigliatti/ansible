#!/bin/bash


DEFAULT=/etc/apache2/sites-available
CHEMIN=`pwd`
FICHIER=serveralias.txt
cd $DEFAULT

for i in *; do
 NAME=`cat $i | grep 'ServerName' | awk '{ print $2 }'`
 ALIAS=`cat $i | grep 'ServerAlias' | awk '{ print $2 }'`
 echo $NAME >> $CHEMIN/test
 echo $ALIAS >> $CHEMIN/test
done
sed '/^$/d' $CHEMIN/test > $CHEMIN/$FICHIER
rm $CHEMIN/test
cd $CHEMIN

