import express from 'express';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import cors from 'cors';

dotenv.config();

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors());

// Create MySQL connection pool
const mysqlPool = mysql.createPool({
  host: 'localhost',
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: 'user',
});

// Create MySQL table
(async () => {
  try {
    const connection = await mysqlPool.getConnection();
    await connection.query(`
      CREATE TABLE IF NOT EXISTS auth (
        id INT PRIMARY KEY AUTO_INCREMENT,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL
      )
    `);
    await connection.query(`
      CREATE TABLE IF NOT EXISTS users (
        email VARCHAR(255) NOT NULL,
        name VARCHAR(255) NOT NULL,
        age VARCHAR(255) NOT NULL,
        location VARCHAR(255) NOT NULL,
        likes VARCHAR(255) NOT NULL,
        dislikes VARCHAR(255) NOT NULL
      )
    `);
    connection.release();
    console.log('MySQL table ready');

  } catch (err) {
    console.error('Error creating MySQL table or retrieving data:', err);
  }
})();

// API route to handle login request
app.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    const connection = await mysqlPool.getConnection();
    const [results] = await connection.query('SELECT * FROM auth WHERE email = ?', [email]);
    connection.release();

    if (results.length > 0) {
      // Email exists in the database
      const user = results[0];

      if (user.password === password) {
        // Login successful, password matches
        console.log("Successful")
        res.status(200).send('Login successful');
      } else {
        // Password does not match
        console.log("Password wrong")
        res.status(401).send('Incorrect password');
      }
    } else {
      // Link to create user page to create new profile
      console.log("Create user")
      res.status(201).send('Create user');
    }
  } catch (err) {
    console.error('Error during login:', err);
    res.status(500).send('Error during login');
  }
});

app.post('/signup', async (req, res) => {
  try {
    const { email, password, name, age, location, likes, dislikes } = req.body;

    // Insert email and password into 'auth' table
    const connection = await mysqlPool.getConnection();
    await connection.query(`INSERT INTO auth (email, password) VALUES (?, ?)`, [email, password])
    await connection.query(`INSERT INTO users (email, name, age, location, likes, dislikes) VALUES (?, ?, ?, ?, ?, ?)`, 
      [email, name, age, location, likes, dislikes]);
    connection.release();

    res.sendStatus(200);
  } catch (error) {
    console.error(error);
    res.sendStatus(500);
  }
});

app.get('/profile', async (req, res) => {
  try {
    const { email } = req.query;
    
    const connection = await mysqlPool.getConnection();
    const [result] = await connection.query('Select * FROM users WHERE email = ?',[email]);
    connection.release();

    let profileData;

    if (result.length > 0) {
      profileData = {
        name: result[0].name,
        age: result[0].age,
        location: result[0].location,
        likes: result[0].likes,
        dislikes: result[0].dislikes,
      }
    }
    res.json(profileData); // Send the profile data as JSON response
  } catch (error) {
    console.error(error);
    res.sendStatus(500);
  }
});


app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
