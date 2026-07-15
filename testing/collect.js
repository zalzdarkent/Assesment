const fs = require('fs');
const path = require('path');
const targetDir = 'home/cron/';

if (!fs.existsSync(targetDir)) {
    fs.mkdirSync(targetDir, { recursive: true });
}

const sekarang = new Date();
const mm = String(sekarang.getMonth() + 1).padStart(2, '0');
const dd = String(sekarang.getDate()).padStart(2, '0');
const yyyy = sekarang.getFullYear();
const hh = String(sekarang.getHours()).padStart(2, '0');
const min = String(sekarang.getMinutes()).padStart(2, '0');

const fileName = `cron_${mm}${dd}${yyyy}_${hh}.${min}.csv`;
const fullPath = path.join(targetDir, fileName);

async function collectData() {
    console.log("Memulai penarikan data dari PokeAPI...");
    try {
        const response = await fetch('https://pokeapi.co/api/v2/pokemon?limit=20');
        const data = await response.json();
        let csvContent = "name,url\n"; 
        data.results.forEach(pokemon => {
            csvContent += `"${pokemon.name}","${pokemon.url}"\n`;
        });
        fs.writeFileSync(fullPath, csvContent, 'utf8');
        console.log(`Sukses: Data Pokemon berhasil disimpan di ${fullPath}`);

    } catch (error) {
        console.error("Error: Gagal mengambil data atau data kosong.", error.message);
    }
}

module.exports = { collectData };