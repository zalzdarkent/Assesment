const fs = require('fs');
const path = require('path');

const targetDir = 'home/cron/';

async function cleanData() {
    if (fs.existsSync(targetDir)) {
        const files = fs.readdirSync(targetDir);
        const sekarang = new Date();
        const satuBulanLalu = 30 * 24 * 60 * 60 * 1000;

        files.forEach(file => {
            const filePath = path.join(targetDir, file);
            const stats = fs.statSync(filePath);
            if (sekarang - stats.mtime > satuBulanLalu) {
                fs.unlinkSync(filePath);
                console.log(`File dihapus karena sudah lebih dari sebulan: ${file}`);
            }
        });
        console.log("Proses data cleansing selesai.");
    } else {
        console.log("Direktori tidak ditemukan.");
    }
}

module.exports = { cleanData };