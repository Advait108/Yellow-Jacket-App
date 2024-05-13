const mysql = require('mysql');
const config = require('./config');

const connection = mysql.createConnection(config);

// Connect to MySQL
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database...');
});

// Update a record
const updatedRecord = { name: 'Jane Doe', email: 'jane@example.com' };
connection.query('UPDATE users SET ? WHERE id = ?', [updatedRecord, 1], (err, result) => {
    if (err) throw err;
    console.log('Record updated:', result.affectedRows);
});

// Close connection
connection.end((err) => {
    if (err) throw err;
    console.log('Connection closed.');
});