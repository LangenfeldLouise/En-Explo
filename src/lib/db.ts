import { readFileSync } from "node:fs";
import { resolve } from "node:path";

interface DatabaseData {
    projets: Projet[];
    outils: Outil[];
    actions: (ActionProjet & { id_projet: number })[];
    outilsProjets: (Outil & { id_projet: number })[];
}

const data = JSON.parse(
    readFileSync(resolve(process.cwd(), ".astro", "site-data.json"), "utf8"),
) as DatabaseData;

export type Projet = {
    id_projet: number;
    titre: string;
    annee: number;
    description_courte: string;
    image_couverture: string;
    alt_image: string;
    en_groupe: number;
    contexte: string;
    demande: string;
    reponse: string;
    id_categorie: number;
};

export type Outil = {
    id_outil: number;
    nom: string;
    logo: string;
    type: string;
};

export type ActionProjet = {
    numero: number;
    titre: string;
    texte: string;
};

export function getProjets(limit?: number): Projet[] {
    return limit && limit > 0 ? data.projets.slice(0, limit) : data.projets;
}

export function getProjet(id: number): Projet | undefined {
    return data.projets.find((projet) => projet.id_projet === id);
}

export function getOutilsCreatifs(): Outil[] {
    return data.outils.filter(
        (outil) => outil.type === "vectoriel" || outil.type === "développement",
    );
}

export function getOutilsByType(type: string): Outil[] {
    return data.outils.filter((outil) => outil.type === type);
}

export function getActionsProjet(id: number): ActionProjet[] {
    return data.actions
        .filter((action) => action.id_projet === id)
        .map(({ numero, titre, texte }) => ({ numero, titre, texte }));
}

export function getOutilsProjet(id: number): Outil[] {
    return data.outilsProjets
        .filter((outil) => outil.id_projet === id)
        .map(({ id_outil, nom, logo, type }) => ({ id_outil, nom, logo, type }));
}