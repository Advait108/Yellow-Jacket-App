const mysql = require('mysql');
const config = require('./config');

const connection = mysql.createConnection(config);

// Connect to MySQL
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database...');
});

// Delete a record
connection.query('DELETE FROM users WHERE id = ?', [1], (err, result) => {
    if (err) throw err;
    console.log('Record deleted:', result.affectedRows);
});

// Close connection
connection.end((err) => {
    if (err) throw err;
    console.log('Connection closed.');
});