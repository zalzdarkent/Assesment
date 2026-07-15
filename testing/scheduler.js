const cron = require('node-cron');
const { collectData } = require('./collect'); 
const { cleanData } = require('./clean');
console.log("Scheduler Cron Job telah aktif di background...");
cron.schedule('0 8,12,15 * * *', () => {
    console.log("Menjalankan tugas otomatisasi penarikan data...");
    collectData();
}, {
    timezone: "Asia/Jakarta" 
});
cron.schedule('0 0 1 * *', () => {
    console.log("Menjalankan tugas pembersihan data lama...");
    cleanData();
}, {
    timezone: "Asia/Jakarta"
});