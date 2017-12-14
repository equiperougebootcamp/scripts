#!/usr/bin/env bash
#premier parametre representant le repertoire dans lequel sera cloner tous les projets
repository_dir=$1

#deuxieme parametre representant la branche de laquelle on doit cloner les les projets
branch=$2

#Un tableau contenant le nom de tous les projets 
projets=("bootcamp.common" "bootcamp.database" "service.crud" "bootcamp.commonws" "bootcamp.rest.service.client" "categorie.service.fonctionnel" "projet.service.fonctionnel" "commentaire.service.fonctionnel" "media.service.fonctionnel" "liketable.service.fonctionnel" "note.service.fonctionnel" "debat.service.fonctionnel"  "censure.service.fonctionnel" "sondage.service.fonctionnel" "notification.generator.services" "preference.service.fonctionnel" "programme.service.fonctionnel" "projet.service.use.case" "categorie.service.use.case")


#On verifie si le repertoire dans lequel sera cloner tous les projets existe
#Et On supprime le repertoire si elle existe
if [ -d "$repository_dir" ]
then
    rm -R "$repository_dir"
fi

#Creation du repertoire dans lequel sera cloner tous les projets existe avec des droits 777 sur le reperstoire
sudo mkdir -p "$repository_dir"
sudo chmod -R 777 "$repository_dir"

#Declaration de la methode clone_project qui permet de parcourir le tableau de projet defini en haut
#Pour chaque ittération du tableau on accede au dossier ou l'on doit cloner les projets 
#On affiche ensuite un message ------------------------------ clone  $projet  project----------------------------------------
#Avec $projet l'ittération en cours du tableau
#Enfin on lance la commande git clone 
clone_project () {
    for projet in ${projets[@]}
        do
            # $1 paramet  er is the name of the project to clone
            cd "$repository_dir"
            echo "------------------------------ clone  $projet  project----------------------------------------"
            git clone https://github.com/rintiobootcamp/"$projet".git -b "$branch"
    done
}

#Execution de la fonction clone_project
clone_project