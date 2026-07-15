const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

let dbSederhana = [];

app.post('/api/formulir', (req, res) => {
    try {
        const { nama, email, pesan } = req.body;

        if (!nama || !email) {
            return res.status(400).json({ 
                success: false, 
                message: 'Nama dan email wajib diisi!' 
            });
        }

        const dataBaru = {
            id: dbSederhana.length + 1,
            nama,
            email,
            pesan,
            createdAt: new Date()
        };

        dbSederhana.push(dataBaru);
        res.status(201).json({ 
            success: true, 
            message: 'Data formulir berhasil disimpan!', 
            data: dataBaru 
        });
    } catch (err) {
        res.status(500).json({ success: false, error: err.message });
    }
});

app.get('/api/formulir', (req, res) => {
    try {
        res.status(200).json({
            success: true,
            totalData: dbSederhana.length,
            data: dbSederhana
        });
    } catch (err) {
        res.status(500).json({ success: false, error: err.message });
    }
});

app.listen(PORT, () => {
    console.log(`Server berjalan lancar di http://localhost:${PORT}`);
});