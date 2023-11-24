#!/bin/bash

# Message d'accueil
echo "--------------------------------------------------"
echo "Bienvenue dans l'application de gestion des tâches."
echo "--------------------------------------------------"

# Boucle principale
while true; do
    echo "Vos options :"
    echo "-----------------------------------------------"
    echo "1. Ajouter une tâche"
    echo "2. Supprimer une tâche"
    echo "3. Afficher les tâches"
    echo "4. Modifier tâche"
    echo "5. Effacer toute la liste"
    echo "6. Quitter"

    read -p "Votre choix : " option

    echo "-----------------------------------------------"
    # À chaque itération de la boucle, la fonction afficher_option est appelée pour afficher les options disponibles à l'utilisateur.
    case $option in
        1)
            read -p "Entrez une tâche : " tache
            echo "$tache" >> tasks.txt
            echo "Tâche ajoutée : $tache"
            ;;
        2)
            if [ -s tasks.txt ]; then
                echo "Liste des tâches :"
                cat -n tasks.txt
                read -p "Entrez le numéro de la tâche à supprimer : " numero
                if [ "$numero" -gt 0 ] 2>/dev/null; then
                    sed -i '' "${numero}d" tasks.txt
                    echo "Tâche supprimée."
                else
                    echo "Numéro de tâche invalide."
                fi
            else
                echo "La liste des tâches est vide."
            fi
            ;;
        3)
            if [ -s tasks.txt ]; then
                echo "Liste des tâches :"
                cat -n tasks.txt
            else
                echo "La liste des tâches est vide."
            fi
            ;;
        4)        
            if [ -s tasks.txt ]; then
                echo "Liste des tâches :"
                cat -n tasks.txt
                read -p "Entrez le numéro de la tâche à modifier : " numero
                read -p "Entrez la nouvelle tâche : " new_tache
                if [ "$numero" -gt 0 ] 2>/dev/null; then
                    sed -i '' "${numero}s/.*/${new_tache}/" tasks.txt
                    echo "Tâche modifiée."
                else
                    echo "Numéro de tâche invalide."
                fi
            else
                echo "La liste des tâches est vide."
            fi
            ;;
        5) 
            echo "Vous avez effacé la liste des tâches."
            >tasks.txt
            ;;
        6) 
            echo "Au revoir !"
            exit
            ;;
        *)
            echo "Option invalide. Veuillez choisir une option valide (1, 2, 3, 4, 5 ou 6)."
            ;;
    esac
done
