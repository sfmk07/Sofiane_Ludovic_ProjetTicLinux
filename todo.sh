#!/bin/bash

# Message d'accueil
echo " --------------------------------------------------"
echo "Bienvenue dans l'application de gestion des tâches."
echo " --------------------------------------------------"

# Boucle principale
# Cette ligne démarre une boucle while qui s'exécute indéfiniment.
while true; do
    echo "Vos options :"
    echo "-----------------------------------------------"
    echo "1. Ajouter une tâche"
    echo "2. Supprimer une tâche"
    echo "3. Afficher les tâches"
    echo "4. Modifier tâche"
    echo "5. Effacer toute la liste"
    echo "6. Quitter"

    read option

    echo "-----------------------------------------------"
    # À chaque itération de la boucle, la fonction afficher_option est appelée pour afficher les options disponibles à l'utilisateur.
    case $option in
        1)
            read -p "Entrez une tâche :" tache
            echo "$tache" >> tasks.txt
            echo "Tache ajoutée : $tache"
            ;;
        2)
            if [ -s tasks.txt ]; then
                echo "Liste des tâches :"
                cat -n tasks.txt
                echo "Entrez le numéro de la tâche à supprimer :"
                read numero
                # Le script utilise la commande sed pour supprimer la ligne correspondante au numéro de tâche choisi par l'utilisateur dans le fichier tasks.txt.
                if [ "$numero" -gt 0 ] 2>/dev/null; then
                    sed -i "${numero}d" tasks.txt
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
                # Cette ligne modifie la tâche introduite par l'utilisateur et l'enregistre dans tasks.txt.
                echo "Liste des tâches :"
                cat -n tasks.txt
                echo "Entrez le numéro de la tâche à modifier :"
                read numero
                echo "Entrez la nouvelle tâche :"
                read new_tache
                # if numero >0 , on ajoute la tache introduite et juste après on va supprimer la ligne suivante car
                # quand on avait ajouté la nouvelle tâche, les données dans tasks.txt ont déjà passé à la ligne suivante
                if [ "$numero" -gt 0 ] 2>/dev/null; then
                    sed -i "${numero}i${new_tache}" tasks.txt
                    ((numero=numero +1))
                    sed -i "${numero}d" tasks.txt                
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