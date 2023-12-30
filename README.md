# CHABLY ADIL FLUTTER AI

## Description du Projet
Dans le cadre de ce projet, j'ai développé une application mobile en employant Flutter, tout en intégrant TensorFlowlite.

![Liste des activités](images/vue d ensemble.png)

## Sommaire
1. [3.1. US#1 : [MVP] Interface de login](#31-us1--mvp-interface-de-login)
2. [3.2. US#2 : [MVP] Liste des activités](#32-us2--mvp-liste-des-activités)
3. [3.3. US#3 : [MVP] Détail d'une activité](#33-us3--mvp-détail-dune-activité)
4. [3.4. US#4 : [MVP] Filtrer sur la liste des activités](#34-us4--mvp-filtrer-sur-la-liste-des-activités)
5. [3.5 US#5 : [MVP] Profil utilisateur] (#34-us4--mvp-filtrer-sur-la-liste-des-activités)
6. [3.5. US#5 : [IA] Ajouter une nouvelle activité](#35-us5--ia-ajouter-une-nouvelle-activité)

## 3.1. US#1 : [MVP] Interface de login

### Objectif
L'objectif de cette fonctionnalité est de permettre aux utilisateurs de se connecter à l'application afin d'accéder à la page suivante.

### Page de Connexion :
1. Lorsque l'application est lancée, une interface de connexion est affichée, comprenant une barre d'en-tête avec le nom de l'application, deux champs de saisie (Login et Mot de passe), ainsi qu'un bouton "Se connecter".
2. Les champs de saisie sont étiquetés "Login" et "Mot de passe".
3. Le champ de saisie du mot de passe est masqué.
4. Le libellé du bouton de connexion est "Se connecter".
5. En cliquant sur le bouton "Se connecter", une vérification est effectuée dans la base de données. Si l'utilisateur existe, il est redirigé vers la page suivante. Si l'utilisateur n'existe pas, un journal est affiché dans la console, mais l'application reste fonctionnelle.
6. En cliquant sur le bouton "Se connecter" avec les deux champs vides, l'application reste fonctionnelle.


### Captures d'écran
![Interface de login](images/1.png)
.
![Interface de login cas erreur](images/2.png)

## 3.2. US#2 : [MVP] Liste des activités

### Objectif
En tant qu'utilisateur connecté, je souhaite visualiser la liste des activités pour choisir celles auxquelles je souhaite m'inscrire.

### Critères d'acceptance
1. Après la connexion, l'utilisateur est dirigé vers la page "Activités", comprenant le contenu principal et une barre de navigation inférieure (BottomNavigationBar) avec trois onglets et leurs icônes respectives : Activités, Ajout et Profil.
2. La page actuellement affichée est celle des "Activités". Son icône et son libellé sont présentés dans une couleur différente des autres onglets.
3. Une liste déroulante de toutes les activités est visible à l'écran.
4. Chaque activité est représentée par une image, un titre, un lieu et un prix.
5. En cliquant sur une entrée de la liste, les détails de l'activité sont affichés (voir US#3).
6. La liste d'activités est récupérée depuis la base de données.


### Capture d'écran
![Liste des activités](images/3.png)

## 3.3. US#3 : [MVP] Détail d'une activité

### Objectif
En tant qu'utilisateur connecté, je souhaite consulter les détails d'une activité pour évaluer si elle correspond à mes préférences.

### Critères d'acceptance
1. La page de détail doit contenir les éléments suivants : une image, un titre, une catégorie (Sport, Shopping, Ludique, ...), le lieu, le nombre minimum de participants requis, et le prix.


### Capture d'écran
![Détail d'une activité](images/3.1.png)

## 3.4. US#4 : [MVP] Filtrer sur la liste des activités

### Objectif
En tant qu'utilisateur connecté, je souhaite avoir la possibilité de filtrer la liste des activités pour afficher uniquement une catégorie spécifique.

### Critères d'acceptance
1. La page "Activités" doit comporter une Barre d'onglets (TabBar) affichant les différentes catégories d'activités.
2. Par défaut, l'onglet "Tous" est sélectionné, montrant l'ensemble des activités disponibles.
3. En cliquant sur l'une des catégories, la liste est filtrée pour présenter uniquement les activités correspondantes à la catégorie choisie.


### Capture d'écran
![Filtrer la liste des activités](images/4.png)

## 3.6. US#5 : [MVP] Profil utilisateur

### Objectif
En tant qu'utilisateur connecté, je souhaite accéder aux informations de mon profil afin de les vérifier et de les modifier si nécessaire.

### Critères d'acceptance
1. Sur la barre de navigation inférieure (BottomNavigationBar), en cliquant sur l'option "Profil", les informations de l'utilisateur s'affichent (récupérées en base de données).
2. Les informations comprennent :
   - Le login (lecture seule)
   - Le mot de passe (obfusqué)
   - L'anniversaire
   - L'adresse
   - Le code postal (affiche le clavier numérique et n'accepte que les chiffres)
   - La ville
3. Un bouton "Valider" permet de sauvegarder les données en base de données.
4. Un bouton "Se déconnecter" permet de retourner à la page de connexion.



### Capture d'écran
![Ajouter une nouvelle activité](images/vue d ensemble.png)

## 3.6. US#6 : [IA] Ajouter une nouvelle activité

### Objectif
En tant qu'utilisateur connecté, je souhaite pouvoir ajouter une nouvelle activité depuis mon profil.

### Critères d'acceptance
1. Sur la barre de navigation inférieure (BottomNavigationBar), l'option "Ajout" permet d'accéder à la page correspondante.
2. Un formulaire s'affiche, comprenant les champs suivants :
   - Image
   - Titre
   - Catégorie (Sport, Shopping)
   - Lieu
   - Nombre minimum de participants requis
   - Prix
3. Un bouton "Valider" permet de sauvegarder les données en base de données.


### Capture d'écran
![Ajouter une nouvelle activité](images/vue d ensemble.png)

