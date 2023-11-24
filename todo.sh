#!/bin/bash

echo "Bienvenue dans le gestionnaire de tâches !"

while true; do #On rentre dans la boucle des choix et le travail se fait dedans.
    echo "-------------------"
    echo "Que voulez-vous faire ?"
    echo "1. Ajouter une tâche"
    echo "2. Supprimer une tâche"
    echo "3. Afficher les tâches"
    echo "4. Quitter"
    echo "5. Effacement de la liste"
    echo "6. Modifier une tâche"
    echo "-------------------"

    read -p "Entrez votre choix : " choix

    case $choix in #Enregistrement du choix et distribution.
        1) #Ajout
            echo "-----------"
            read -p "Entrez la description de la tâche : " description
            echo "$description" >> tasks.txt #Ajout de la task et création du fichier en même temps.
            echo "~~~~~~~~~~~"
            echo "Tâche ajoutée avec succès !"
            echo "~~~~~~~~~~~"
            ;;
        2) #Suppresion
            echo "--------------"
            read -p "Entrez le numéro de la tâche à supprimer : " numero
            if [ "$(sed -n "${numero}p" tasks.txt)" ]; then
                sed -i "${numero}d" tasks.txt #Sed fait la recherche du nombre encodé et la supprime.
                echo "~~~~~~~~~~~"
                echo "Tâche supprimée avec succès !"
                echo "~~~~~~~~~~~"
            else
                echo "~~~~~~~~~~~"
                echo "La tâche n'existe pas."
                echo "~~~~~~~~~~~"
            fi
            ;;
        3) #Affichage
            if [ -s tasks.txt ]; then
                echo "~~~~~~~~~~~"
                echo "Voici la liste des tâches :"
                cat tasks.txt
            else
                echo "~~~~~~~~~~~"
                echo "Il n'y a pas de tâches à afficher."
                echo "~~~~~~~~~~~"
            fi
            ;;
        4) #Sortie
            echo "~~~~~~~~~~~"
            echo "Au revoir !"
            echo "~~~~~~~~~~~"
            exit 0
            ;;
        5) #L'effaceur
        echo "~~~~~~~~~~~"
            echo "Effacement en cours.."
            > tasks.txt
            echo "~~~~~~~~~~~"
            echo "Liste effacée avec succès !"
            echo "~~~~~~~~~~~"
            ;;
        6) #Modifier une tâche
            if [ -s tasks.txt ]; then
                # Cette ligne modifie la tâche introduite par l'utilisateur et l'enregistre dans tasks.txt.
                echo "~~~~~~~~~~~~"
                echo "Liste des tâches :"
                cat -n tasks.txt
                echo "--------"
                read -p "Entrez le numéro de la tâche à modifier :" numero
                read -p "Entrez la nouvelle tâche :" new_tache
                echo "-----------"
                # if numero >0 , on ajoute la tache introduite et juste après on va supprimer la ligne suivante car
                # quand on avait ajouté la nouvelle tâche, les données dans tasks.txt ont déjà passé à la ligne suivante
                if [ "$numero" -gt 0 ] 2>/dev/null; then
                    sed -i "${numero}i${new_tache}" tasks.txt
                    ((numero=numero +1))
                    sed -i "${numero}d" tasks.txt
                    echo "~~~~~~~~~~~~~~"
                    echo "Tâche modifiée."
                    echo "~~~~~~~~~~~~~~"
                else
                    echo "~~~~~~~~~~~~"
                    echo "Numéro de tâche invalide."
                    echo "~~~~~~~~~~~~"
                fi
            else
                echo "~~~~~~~~~~~"
                echo "La liste des tâches est vide."
                echo "~~~~~~~~~~~"
            fi
            ;;
        *)
            echo "~~~~~~~~~~~~"
            echo "Choix invalide."
            echo "~~~~~~~~~~~~"
            ;;
        
    esac
done
