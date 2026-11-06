// src/lib/assets.ts
const files = import.meta.glob<{ default: ImageMetadata }>(
    '/src/assets/**/*.{svg,png,avif,jpg,webp}',
    { eager: true }
);

export function resolveAsset(path: string): ImageMetadata {
    // Gère les anciens chemins Windows ET les simples noms de fichier
    const name = path.split(/[\\/]/).pop()!;
    const key = Object.keys(files).find((k) => k.endsWith('/' + name));
    if (!key) throw new Error(`Asset introuvable : ${name}`);
    return files[key].default;
}