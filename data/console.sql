CREATE TABLE CATEGORIE (
    id_categorie INTEGER PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

CREATE TABLE OUTIL (
    id_outil INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    logo BLOB,
    type VARCHAR(30)
);

CREATE TABLE COLLABORATEUR (
    id_collaborateur INTEGER PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE PROJET (
    id_projet INTEGER PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    annee INTEGER,
    description_courte VARCHAR(255),
    image_couverture VARCHAR(255),
    alt_image VARCHAR(255),
    en_groupe INTEGER,
    contexte VARCHAR(500),
    demande VARCHAR(500),
    reponse VARCHAR(500),
    id_categorie INTEGER NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES CATEGORIE(id_categorie)
);

CREATE TABLE ACTION (
    id_projet INTEGER,
    numero INTEGER,
    titre VARCHAR(100),
    texte VARCHAR(500),
    PRIMARY KEY (id_projet, numero),
    FOREIGN KEY (id_projet) REFERENCES PROJET(id_projet)
);

CREATE TABLE UTILISER (
    id_projet INTEGER,
    id_outil INTEGER,
    PRIMARY KEY (id_projet, id_outil),
    FOREIGN KEY (id_projet) REFERENCES PROJET(id_projet),
    FOREIGN KEY (id_outil) REFERENCES OUTIL(id_outil)
);

CREATE TABLE PARTICIPER (
    id_projet INTEGER,
    id_collaborateur INTEGER,
    PRIMARY KEY (id_projet, id_collaborateur),
    FOREIGN KEY (id_projet) REFERENCES PROJET(id_projet),
    FOREIGN KEY (id_collaborateur) REFERENCES COLLABORATEUR(id_collaborateur)
);

INSERT INTO CATEGORIE (id_categorie, libelle) VALUES
(1, 'Tous'),
(2, 'Site web'),
(3, 'Affiches'),
(4,'Autres');

INSERT INTO OUTIL (id_outil, nom, logo, type) VALUES
(1,'Figma', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\Figma.svg', 'vectoriel'),
(2, 'Krita', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\krita.svg', 'vectoriel'),
(3, 'Affinity', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\Affinity.svg', 'vectoriel'),
(4, 'Ibis Paint', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\ibispaint.png', 'vectoriel'),
(5, 'ChatGPT', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\ChatGPT.svg', 'IA'),
(6, 'Claude', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\Claude.svg', 'IA'),
(7, 'Mistral', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\Mistral.svg', 'IA'),
(8, 'Astro', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\astro.svg', 'développement'),
(9, 'Tailwind', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\Tailwind.png', 'développement'),
(10,'Infomaniak', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\InfoManiak.png', 'développement'),
(11, 'DaisyUI', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\DaisyUI.png','développement');

INSERT INTO COLLABORATEUR (id_collaborateur, nom)
VALUES
    (1, 'Lucie Garcia'),
    (2, 'Emma Badarous');

INSERT INTO PROJET (id_projet, titre, annee, description_courte, image_couverture, alt_image, en_groupe, contexte, demande, reponse, id_categorie)
VALUES
(1, 'Fonds d''écrans', 2025, 'La personnalisation de plusieurs environnements.', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\fondEcran.avif', 'Montagnes noires devant une lune sur fond vert', 0,
     'Projet personnel, j’avais besoin d’un environnement plus personnalisé.', 'Créer 3 fonds sur le thème de la nature.', 'Une série d illustrations vectorielles aux aplats de couleurs.', 4),
(2, 'Onyoz', 2026, 'Une expérience web pour aidez les étudiants à se restaurer convenablement.', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\Onyoz.avif', 'Logo Onyoz avec un oignon sur fond rouge-bordeaux', 1,
     'Un projet scolaire en groupe, qui à permis de concrétiser mes apprentissages.', 'L’objectif était de proposé, à partir d’un idée innovante d’élèves, un site web plus poussé. Ici Onyoz à pour objectif d’aider les étudiants à trouver de quoi se restaurer facilement, proche d’eux mais aussi dans leur budget.', 'Un positionnement clair, une palette minimaliste mais justifier, qui permet d’être reconnu facilement, une identiter simple. Tous ses ingrédients pour développer un site crédible et fonctionnel.', 2),
(3, 'Flyers A3P90', 2026, 'Création d''un flyers pour une association Belfortaine.', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\A3P90.avif', 'Flyer vert de l''association A3P90 avec des enfants', 0,
     'L''association ma contacter pour refaire leur flyer qui ne leur convenait plus.', 'Créer une communication visuelle à partir d''une demande et de contraintes.', 'Un flyer vert aux formes arrondies mettant en avant le parrainage.', 3),
(4, 'Badges Scouts', 2026, 'Création de badge en vue d''un regroupement de Scout pour lancer une nouvelle année.', '\MMI_2\S3_Projet-ind\En-Explo\src\assets\Badge.avif', 'Plusieurs badges ronds de couleurs avec une empreinte de patte', 0,
     'En vue d''rassemblement annuel sur le thème du livre de la jungle, je me suis mise au défis de faire des badges avec un temps de création relativement court.', 'Créer des badges pour un thème donné.', 'Septs badges colorés, un par unité.', 4);

INSERT INTO ACTION (id_projet, numero, titre, texte)
VALUES
    (2, 1, 'Nom', 'Nous avons construit Onyoz via plusieurs idées : le prix, l’accéssibilité, et le choix. La où nous étions d’abord parties sur un jeu de mot, j’ai mis en avant un nom plus commun et avec un sujet précis, comme un object ou un légume.
Dans nôtre cas, l’élement qui ce rapprochait le plus de nos objectifs etait l’ognion.'),
    (2, 2, 'Couleurs', 'Palette très réduite : rouge-bordeaux, blanc et vert.'),
    (2, 3, 'Logo', 'Pour le logo nous avons décidé d''illustrer le sens de notre nom. Comme Onyoz viens de l’ognion, nous avons commencer à travailler avec cet aliment.

Nous avons d’abord aborder l’idée de l’ognion blanc et rouge. Mais avec l’ognion nouveaux, j’ai pu expériementer des grandes formes, simple et significative, qui, après quelques modifications, donna le logo d’Onyoz.'),
    (2, 4, 'Maquette', 'Pour la maquette les tâches étaient réparties, je me suis donc occupés de la maquette desktop, tout en aidant sur la version mobile.'),
    (1, 1, 'Couleurs', 'J’ai utilisée des couleurs qui plaisait à mon entourage, également à moi en ce qui concerne mon fond d’écran.'),
    (1, 2, 'Dégradés', 'Jeu d''ombres et de lumière autour de la lune.'),
    (1,3,'Formes','Utilisation franche de vecteurs. Formes simples.'),
    (3, 1, 'Couleurs', 'Respect de l’identité visuelle de l’association.'),
    (3, 2, 'Mise en page', 'Placement des photos dans des feuilles de trèfles, rapport direct avec leur logo.'),
    (3, 3, 'Export', 'Préparation du fichier pour l’impression.');

INSERT INTO UTILISER (id_projet, id_outil)
VALUES
    (1, 1), (1,2), (1,4),
    (2, 1), (2, 8), (2,10), (2,5), (2, 6),
    (3, 1);

INSERT INTO PARTICIPER (id_projet, id_collaborateur)
VALUES
    (2, 1), (2, 2);

SELECT *
FROM PROJET
WHERE annee = 2026
ORDER BY titre;

SELECT titre
FROM PROJET
WHERE titre LIKE 'F%';

SELECT titre, annee
FROM PROJET
WHERE annee BETWEEN 2025 AND 2026;

SELECT nom, type
FROM OUTIL
WHERE type = 'vectoriel' OR type = 'IA';

SELECT titre
FROM PROJET
WHERE alt_image IS NULL;

SELECT COUNT(*) AS nb_projets
FROM PROJET;

SELECT MIN(annee) AS plus_ancien, MAX(annee) AS plus_recent
FROM PROJET;

SELECT COUNT(*) AS nb_groupe
FROM PROJET
WHERE en_groupe = 1;

SELECT annee, COUNT(*) AS nb_projets
FROM PROJET
GROUP BY annee;

SELECT type, COUNT(*) AS nb_outils
FROM OUTIL
GROUP BY type;

SELECT annee, COUNT(*) AS nb_projets
FROM PROJET
GROUP BY annee
HAVING COUNT(*) > 1;

SELECT P.titre, C.libelle
FROM PROJET P, CATEGORIE C
WHERE P.id_categorie = C.id_categorie;

SELECT CO.nom
FROM COLLABORATEUR CO, PARTICIPER PA, PROJET P
WHERE CO.id_collaborateur = PA.id_collaborateur
  AND PA.id_projet = P.id_projet
  AND P.titre = 'Onyoz';

SELECT DISTINCT O.nom
FROM OUTIL O, UTILISER U, PROJET P, CATEGORIE C
WHERE O.id_outil = U.id_outil
  AND U.id_projet = P.id_projet
  AND P.id_categorie = C.id_categorie
  AND C.libelle = 'Site web';

SELECT P.titre, COUNT(*) AS nb_actions
FROM PROJET P, ACTION A
WHERE P.id_projet = A.id_projet
GROUP BY P.id_projet, P.titre;

SELECT P.titre
FROM PROJET P
WHERE NOT EXISTS (SELECT *
                  FROM PARTICIPER PA
                  WHERE PA.id_projet = P.id_projet);

SELECT nom
FROM OUTIL
WHERE id_outil NOT IN (SELECT id_outil
                       FROM UTILISER);

SELECT titre, annee
FROM PROJET
WHERE annee = (SELECT MAX(annee)
               FROM PROJET);

SELECT C.libelle
FROM CATEGORIE C
WHERE NOT EXISTS (SELECT *
                  FROM PROJET P
                  WHERE P.id_categorie = C.id_categorie);

SELECT CO.nom
FROM COLLABORATEUR CO
WHERE NOT EXISTS (SELECT *
                  FROM PROJET P
                  WHERE P.en_groupe = 1
                    AND NOT EXISTS (SELECT *
                                    FROM PARTICIPER PA
                                    WHERE PA.id_projet = P.id_projet
                                      AND PA.id_collaborateur = CO.id_collaborateur));

SELECT P.titre
FROM PROJET P
WHERE NOT EXISTS (SELECT *
                  FROM OUTIL O
                  WHERE O.type = 'vectoriel'
                    AND NOT EXISTS (SELECT *
                                    FROM UTILISER U
                                    WHERE U.id_outil = O.id_outil
                                      AND U.id_projet = P.id_projet));