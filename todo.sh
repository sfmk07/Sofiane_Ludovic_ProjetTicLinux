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
        2)
            read -p "Entrez le numéro de la tâche à supprimer : " numero

            if [ "$(sed -n "${numero}p" tasks.txt)" ]; then
                sed -i "${numero}d" tasks.txt
                echo "Tâche supprimée avec succès !"
            else
                echo "La tâche n'existe pas."
            fi
            ;;
        3)
            if [ -s tasks.txt ]; then
                echo "Voici la liste des tâches :"
                cat tasks.txt
            else
                echo "Il n'y a pas de tâches à afficher."
            fi
            ;;
        4)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "Choix invalide."
            ;;

    esac
done
