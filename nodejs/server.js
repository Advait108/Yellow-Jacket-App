const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Initialize userCredentials with an empty passwordHash
let userCredentials = {
    email: "advait.alluri@gmail.com",
    passwordHash: "" // This will be set by the setupUser function
};

// Function to hash a password and update userCredentials
async function setupUser(email, password) {
    const salt = await bcrypt.genSalt(10);
    userCredentials.passwordHash = await bcrypt.hash(password, salt);
    console.log("User setup complete."); // Optional: Remove this line in production
}

// Call setupUser function for initial setup
setupUser(userCredentials.email, "123");

app.use(express.json());
app.use(cors());

app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    if (email === userCredentials.email && await bcrypt.compare(password, userCredentials.passwordHash)) {
        const token = jwt.sign({ email: userCredentials.email }, process.env.JWT_SECRET, { expiresIn: '24h' });
        res.json({ token });
    } else {
        res.status(401).send({ message: "Invalid credentials" });
    }
});

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
