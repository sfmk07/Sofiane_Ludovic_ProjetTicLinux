#!/bin/bash

echo "Bienvenue dans le gestionnaire de tâches !"

while true; do #On rentre dans la boucle des choix et le travail se fait dedans.
    echo "Que voulez-vous faire ?"
    echo "1. Ajouter une tâche"
    echo "2. Supprimer une tâche"
    echo "3. Afficher les tâches"
    echo "4. Quitter"
    echo "5. Effacement de la liste"

    read -p "Entrez votre choix : " choix

    case $choix in #Enregistrement du choix et distribution.
        1) #Ajout
            read -p "Entrez la description de la tâche : " description
            echo "$description" >> tasks.txt #Ajout de la task et création du fichier en même temps.
            echo "Tâche ajoutée avec succès !"
            ;;
        2) #Suppresion
            read -p "Entrez le numéro de la tâche à supprimer : " numero

            if [ "$(sed -n "${numero}p" tasks.txt)" ]; then
                sed -i "${numero}d" tasks.txt #Sed fait la recherche du nombre encodé et la supprime.
                echo "Tâche supprimée avec succès !"
            else
                echo "La tâche n'existe pas."
            fi
            ;;
        3) #Affichage
            if [ -s tasks.txt ]; then
                echo "Voici la liste des tâches :"
                cat tasks.txt
            else
                echo "Il n'y a pas de tâches à afficher."
            fi
            ;;
        4) #Sortie
            echo "Au revoir !"
            exit 0
            ;;
        5) #L'effaceur
            echo "Effacement en cours.."
            echo "" > tasks.txt
            echo "Liste effacée avec succès !"
            ;;
        *)
            echo "Choix invalide."
            ;;
        
    esac
done
