
const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;


let users = [
    { email: "advait.alluri@gmail.com", password: "123", passwordHash: "" },
    { email: "user2@example.com", password: "abc", passwordHash: "" },
    { email: "user3@example.com", password: "xyz", passwordHash: "" }
];

// Function to hash passwords and update users array with passwordHashes
async function setupUsers() {
    for (let user of users) {
        const salt = await bcrypt.genSalt(10);
        user.passwordHash = await bcrypt.hash(user.password, salt);
        // Clear plaintext password after hashing for security
        delete user.password;
    }
    console.log("Users setup complete."); // Optional: Log for confirmation, remove in production
}

// Call setupUsers function for initial setup
setupUsers();

app.use(express.json());
app.use(cors());

app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    // Find user by email
    const user = users.find(u => u.email === email);

    // Check if user exists and password is correct
    if (user && await bcrypt.compare(password, user.passwordHash)) {
        const token = jwt.sign({ email: user.email }, process.env.JWT_SECRET, { expiresIn: '24h' });
        res.json({ token });
    } else {
        res.status(401).send({ message: "Invalid credentials" });
    }
});

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));


/*
const mysql = require('mysql');
const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const cors = require('cors');
require('dotenv').config();

const app = express();


const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Balram510!',
  database: 'user_auth'
});

connection.connect(err => {
  if (err) {
    console.error('Error connecting to the database: ' + err.stack);
    return;
  }
  console.log('Connected to the database with thread ID: ' + connection.threadId);
});

app.use(express.json());
app.use(cors());

app.post('/login', (req, res) => {
  const { email, password } = req.body;
  connection.query('SELECT * FROM users WHERE email = ?', [email], (error, results, fields) => {
    if (error) {
      res.status(500).send({ message: "Server error" });
    }
    const user = results[0];
    if (user && password === user.password) {
      const token = jwt.sign({ email: user.email }, process.env.JWT_SECRET, { expiresIn: '24h' });
      res.json({ token });
    } else {
      res.status(401).send({ message: "Invalid credentials" });
    }
  });
});


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
*/