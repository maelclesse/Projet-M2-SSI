#!/bin/sh

#Auteur : Maël CLESSE

#Script shell permettant de rechercher une expression dans un ou plusieurs fichiers
#Pour le projet, le but est de l'utiliser pour essayer de découvrir les données sensibles qui pourraient 
#être récupérées sur le site Pastebin au cours d'une journée classique

#Shell script allowing you to search for an expression into one or multiple files
#For this project, the goal was to use it in order to find some sensitive data that might be
#collected on Pastebin on a normal day

read -p "Enter the path to the files you want to check " path
while true; do
	read -p "Enter the name of the file where to put the results " fichier
	read -p "Enter the expression you are looking for " exp
	#on créé une en-tête pour le fichier où seront stockés les résultats
	#we create the header of the file in which the content will be put
	echo " ------------------------" >> $fichier
	echo "|     File analyzer      |" >> $fichier
	echo "| Created by Mael Clesse |" >> $fichier
	echo " ------------------------" >> $fichier
	echo " " >> $fichier
	#on recherche l'expression dans tous les fichiers du path et on écrit les résultats dans le 
	#fichier de destination
	#we search the expression into every file of the path and write the results in the
	#destination file
	zmore $path | grep $exp >> $fichier
	echo " " >> $fichier
	echo "Number of occurences of "$exp" into the file(s) : " >> $fichier
	grep -o $exp $fichier | wc -l >> $fichier
	echo "You can see the result of the search into the file "$fichier
done
