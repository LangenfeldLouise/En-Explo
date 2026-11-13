# 1. Accessibilité — votre site est-il utilisable par tout le monde ?

Le site a des bases, mais on ne peux pas dire qu'il est accessible à tout le monde.

## positif

- français (`lang="fr"`) + pages à titres
- plusieurs images avec texte alternatif
- formulaire de contact : `<label>` à chaque champ, champs obligatoires + annonce son état avec `aria-live`.
- Les contrôles de filtrage sont de vrais boutons et signalent leur état avec
  `aria-pressed`.
- animations principales désactivées quand la page ce rapticie. (début avec le cercle et le carousel)

## négatif

- menu mobile déclencheur : `<div role="button" tabindex="0">` -> il ne réagit pas automatiquement à Entrée/Espace donc compliqué avec un clavier.  correction à apporté : remplacer par un bouton natif et vérifier ouverture, fermeture et annonces au lecteur d'écran.
- Aucun lien d'évitement vers le contenu principal n'est présent sur toutes les pages.
- Les contrastes, la navigation complète au clavier, le zoom, les petits écrans, les pages avec lecteur d'écran n'ont pas été mesurés.
- Le formulaire dépend de JavaScript pour ouvrir le logiciel de messagerie. -> Prévoir un bon traitement côté serveur/remplacer le formulaire par un lien e-mail clairement présenté.

# 2. Sobriété et performance — que coûte votre site à charger, et pourquoi ?

## positif

- pages statiques : les pages consultées ne nécessitent pas de rendu serveur dynamique à chaque visite.
- images -> `astro:assets`
- peu de scripts côté navigateur
- 87 fichiers pour environ 0,93 Mio au total

## négatif

- Chargement de trois familles de polices depuis Google Fonts.
- Le carousel d'outils anime en continu. La prise en compte de `prefers-reduced-motion` est positive ; vérifier aussi que l'animation reste discrète et ne gêne pas la lecture.

# 3. Référencement — votre site est-il compréhensible par une machine ?

incomplet

## positif

- pages : titre + description, leurs titres principaux décrivent le contenu.
- HTML sémantique (`main`, `nav`, titres, listes et liens) = contenu compréhensible sans dépendre uniquement de JavaScript.
- site statique, avec des pages de projets individuelles et des liens internes entre les pages.

# 4. Conformité juridique — que devez-vous à vos visiteurs et aux auteurs des contenus que vous publiez ?

- Nous leurs devons une transparence total sur l'utilisation de leurs données, ici l'email et le nom et le message dans le formulaire.
- L'adresse e-mail est affichée. Cela facilite le contact, mais peut aussi accroître le spam.
- Les polices sont demandées à Google Fonts.
- Aucun outil de suivi ou cookie de mesure d'audience.
- Le pied de page affiche un nom et un copyright.
- Les photographies, illustrations, polices, logos et projets présentés sont personnels ou en collaboration.