const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(express.json());

// 🔥 เชื่อมต่อฐานข้อมูล MySQL
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// 🔥 ทดสอบเชื่อมต่อ API
app.get('/api/categories', (req, res) => {
    const sql = 'SELECT * FROM categories';
    db.query(sql, (err, result) => {
      if (err) return res.status(500).json({ error: err });
      res.json(result);
    });
  });
  
  // 🔥 ดึงสินค้าตามหมวดหมู่ (code)
  app.get('/api/products', (req, res) => {
    const categoryCode = req.query.category;
    if (!categoryCode) {
      return res.status(400).json({ error: 'Missing category' });
    }
  
    const sql = `
      SELECT p.* FROM product p
      JOIN categories c ON p.category_id = c.category_id
      WHERE c.category_code = ?
    `;
  
    db.query(sql, [categoryCode], (err, result) => {
      if (err) {
        console.error("SQL Error:", err);
        return res.status(500).json({ error: err });
      }
      console.log("ส่งข้อมูล:", result); // 🔥 ตรวจสอบว่าข้อมูลเป็น Array
      res.json(result);
    });
  });
  
  // 🔥 เริ่ม Server
  const PORT = process.env.PORT;
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
