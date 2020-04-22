'use strict';

const express = require('express');
const app = express();
const fs = require("fs");

app.get('/Marcacao', (req, res) => {
    fs.readFile('marcacao.json', (err, data) => {
        if (err) throw err;
        let student = JSON.parse(data);
        res.send(student);
    });
});

// Listen to the App Engine-specified port, or 8080 otherwise
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}...`);
});