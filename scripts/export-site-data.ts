// @ts-expect-error bun:sqlite is provided by the Bun runtime
import { Database } from "bun:sqlite";
import { mkdirSync, writeFileSync } from "node:fs";
import { dirname, resolve } from "node:path";

const database = new Database(
    resolve(process.cwd(), "data", "portfolio.db"),
    { readonly: true },
);
const outputPath = resolve(process.cwd(), ".astro", "site-data.json");

try {
    const data = {
        projets: database
            .query("SELECT * FROM PROJET ORDER BY annee DESC, id_projet DESC")
            .all(),
        outils: database.query("SELECT * FROM OUTIL ORDER BY id_outil").all(),
        actions: database
            .query(
                "SELECT id_projet, numero, titre, texte FROM ACTION ORDER BY id_projet, numero",
            )
            .all(),
        outilsProjets: database
            .query(`
                SELECT u.id_projet, o.id_outil, o.nom, o.logo, o.type
                FROM UTILISER u
                JOIN OUTIL o ON o.id_outil = u.id_outil
                ORDER BY u.id_projet, o.id_outil
            `)
            .all(),
    };

    mkdirSync(dirname(outputPath), { recursive: true });
    writeFileSync(outputPath, JSON.stringify(data));
} finally {
    database.close();
}
