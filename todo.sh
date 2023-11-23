#!/bin/bash

echo "Bienvenue dans le gestionnaire de tâches !"

while true; do
    echo "Que voulez-vous faire ?"
    echo "1. Ajouter une tâche"
    echo "2. Supprimer une tâche"
    echo "3. Afficher les tâches"
    echo "4. Quitter"

    read -p "Entrez votre choix : " choix

    case $choix in
        1)
            read -p "Entrez la description de la tâche : " description
            echo "$description" >> tasks.txt
            echo "Tâche ajoutée avec succès !"
            ;;
    esac
done
