const mysql = require('mysql');
const config = require('./config');

const connection = mysql.createConnection(config);

// Connect to MySQL
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database...');
});

// Retrieve records
connection.query('SELECT * FROM users', (err, results) => {
    if (err) throw err;
    console.log('Retrieved records:');
    console.log(results);
});

// Close connection
connection.end((err) => {
    if (err) throw err;
    console.log('Connection closed.');
});