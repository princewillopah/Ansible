const express = require('express');
const app = express();
const path = require('path');
const port = process.env.PORT || 3000;

// Serve static files from the "public" directory
// app.use(express.static('public'));

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));


// Define routes for the different pages
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'views', 'index.html'));
});

app.get('/about', (req, res) => {
  res.sendFile(path.join(__dirname, 'views', 'about.html'));
});

app.get('/contact', (req, res) => {
  res.sendFile(path.join(__dirname, 'views', 'contact.html'));
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});