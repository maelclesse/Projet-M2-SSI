#!/bin/sh

#Auteur : Maël CLESSE

#Script shell permettant de rechercher une expression dans un ou plusieurs fichiers
#Pour le projet, le but est de l'utiliser pour essayer de découvrir les données sensibles qui pourraient 
#être récupérées sur le site Pastebin au cours d'une journée classique

read -p "Saisir le chemin vers le(s) fichier(s) a analyser " path
while true; do
	read -p "Saisir le fichier dans lequel stocker les resultats " fichier
	read -p "Saisir l'expression a rechercher " exp
	#on créé une en-tête pour le fichier où seront stockés les résultats
	echo "Analyse de fichiers" >> $fichier
	echo "Créé par Mael Clesse" >> $fichier
	#on recherche l'expression dans tous les fichiers du path et on écrit les résultats dans le 
	#fichier de destination
	zmore $path | grep $exp >> $fichier
	echo "Nombre d'occurrences de "$exp" dans le(s) fichier(s) : " >> $fichier
	grep -o $exp $fichier | wc -l >> $fichier
	echo "Vous pouvez consulter les resultats de la recherche dans le fichier "$fichier
done
