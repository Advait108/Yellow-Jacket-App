const mysql = require('mysql');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

const email = 'test1@gmail.com';
const plainPassword = 'test1';

async function hashPassword(password) {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(password, salt);
}

async function insertUser(email, password) {
    const hashedPassword = await hashPassword(password);
    pool.query('INSERT INTO users (email, passwordHash) VALUES (?, ?)', [email, hashedPassword], (err, results) => {
        if (err) {
            console.error('Error inserting user:', err);
            return;
        }
        console.log('User inserted with ID:', results.insertId);
    });
}

insertUser(email, plainPassword);
