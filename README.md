# Technical Assessment - Digital Transformation & Analytics PT. Huawei Tech Investment

Repositori ini berisi solusi teknis untuk proses rekrutmen Digital Transformation & Analytics di PT. Huawei Tech Investment. Proyek ini mencakup pengembangan Backend & Frontend sederhana, skrip otomatisasi (Cron Job), serta pemrosesan data menggunakan SQL Query.

---

## 📂 Struktur Repositori

```text
huawei-technical-test/
├── backend/
│   ├── index.html          # Frontend sederhana (Form & Tabel)
│   ├── index.js            # Server Express (Penyimpanan Array)
│   ├── package.json        # Dependensi Backend
│   └── .env                # Port & Konfigurasi Lingkungan
│
├── automation/
│   ├── scheduler.js        # Script Cron Job Utama (PokeAPI & Cleansing)
│   ├── package.json        # Dependensi Automation
│   └── cron-data/          # Folder output hasil collect data .csv (Dibuat otomatis)
│
├── sql-queries/
│   └── queries.sql         # Kumpulan query SQL (Create, Insert, Update)
│
└── README.md               # Dokumentasi Setup