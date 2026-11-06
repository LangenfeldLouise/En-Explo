import Database from 'better-sqlite3';
import { resolve } from 'node:path';

const db = new Database(
    resolve(process.cwd(), 'data', 'portfolio.db'),
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

export function getProjets(limit?: number): Projet[] {
    const sql = `SELECT * FROM PROJET ORDER BY annee DESC, id_projet DESC ${limit ? 'LIMIT ?' : ''}`;
    const stmt = db.prepare(sql);
    return (limit ? stmt.all(limit) : stmt.all()) as Projet[];
}

export function getProjet(id: number): Projet | undefined {
    return db.prepare('SELECT * FROM PROJET WHERE id_projet = ?').get(id) as Projet | undefined;
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