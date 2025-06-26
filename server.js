const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

let fruits = [
  { id: 1, name: 'apple' },
  { id: 2, name: 'orange' }
];

app.get('/fruits', (req, res) => {
  res.json(fruits);
});

app.get('/fruits/:id', (req, res) => {
  const fruit = fruits.find(f => f.id === parseInt(req.params.id));
  if (!fruit) return res.status(404).send('Fruit topilmadi');
  res.json(fruit);
});

app.post('/fruits', (req, res) => {
  if (!req.body.name || req.body.name.length < 3) {
    return res.status(400).send("Meva nomi kamida 3 belgidan iborat bo'lishi kerak");
  }
  
  const fruit = {
    id: fruits.length + 1,
    name: req.body.name
  };
  
  fruits.push(fruit);
  res.status(201).json(fruit);
});

app.put('/fruits/:id', (req, res) => {
  const fruit = fruits.find(f => f.id === parseInt(req.params.id));
  if (!fruit) return res.status(404).send('Fruit topilmadi');
  
  if (!req.body.name || req.body.name.length < 3) {
    return res.status(400).send("Meva nomi kamida 3 belgidan iborat bo'lishi kerak");
  }
  
  fruit.name = req.body.name;
  res.json(fruit);
});

app.delete('/fruits/:id', (req, res) => {
  const fruit = fruits.find(f => f.id === parseInt(req.params.id));
  if (!fruit) return res.status(404).send('Fruit topilmadi');
  
  const index = fruits.indexOf(fruit);
  fruits.splice(index, 1);
  
  res.json(fruit);
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server ${port} portida ishga tushdi...`));