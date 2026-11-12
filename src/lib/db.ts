// @ts-expect-error bun:sqlite est fourni par le runtime Bun
import { Database } from "bun:sqlite";
import { resolve } from "node:path";

const db = new Database(
    resolve(process.cwd(), "data", "portfolio.db"),
    { readonly: true }
);
export default db;

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
    const sql = `SELECT * FROM PROJET ORDER BY annee DESC, id_projet DESC ${limit ? 'LIMIT ?' : ''}`;
    const stmt = db.prepare(sql);
    return (limit ? stmt.all(limit) : stmt.all()) as Projet[];
}

export function getProjet(id: number): Projet | undefined {
    return (db.prepare('SELECT * FROM PROJET WHERE id_projet = ?').get(id) as Projet | null) ?? undefined;
}

export function getOutilsCreatifs(): Outil[] {
    return db
        .prepare(`SELECT * FROM OUTIL WHERE type IN ('vectoriel', 'développement') ORDER BY id_outil`)
        .all() as Outil[];
}

export function getOutilsByType(type: string): Outil[] {
    return db
        .prepare('SELECT * FROM OUTIL WHERE type = ? ORDER BY id_outil')
        .all(type) as Outil[];
}

export function getActionsProjet(id: number): ActionProjet[] {
    return db
        .prepare('SELECT numero, titre, texte FROM ACTION WHERE id_projet = ? ORDER BY numero')
        .all(id) as ActionProjet[];
}

export function getOutilsProjet(id: number): Outil[] {
    return db
        .prepare(`
            SELECT o.id_outil, o.nom, o.logo, o.type
            FROM UTILISER u
            JOIN OUTIL o ON o.id_outil = u.id_outil
            WHERE u.id_projet = ?
            ORDER BY o.id_outil
        `)
        .all(id) as Outil[];
}