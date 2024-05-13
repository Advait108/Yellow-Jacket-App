const mysql = require('mysql');
const config = require('./config');

const connection = mysql.createConnection(config);

// Connect to MySQL
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database...');
});

// Insert a new record
const newRecord = { name: 'John Doe', email: 'john@example.com' };
connection.query('INSERT INTO users SET ?', newRecord, (err, result) => {
    if (err) throw err;
    console.log('New record inserted:', result.insertId);
});

// Close connection
connection.end((err) => {
    if (err) throw err;
    console.log('Connection closed.');
});