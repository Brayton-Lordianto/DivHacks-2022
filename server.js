require('./model');

const path = require('path');
const express = require('express');
const cors = require('cors');

console.log('environment    ', process.env.ENVIRONMENT)
console.log('PORT    ', process.env.PORT)
console.log('MONGO_CONNECTION_STRING    ', process.env.MONGODB_URI)

require('dotenv').config({ path: "./config.env" });

const FoodMgmt = require('./crud/food.mgmt');

const app = express();
const port = process.env.PORT || 3080;

app.use(cors());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, '../build')));
app.use(express.json());

// get foods
app.put('/api/get', (req, res) => {
  FoodMgmt.getFoods().then(data => res.json(data));
});

// create foods
app.post('/api/create', (req, res) => {
  FoodMgmt.createFood(req.body.food).then(data => res.json(data));
});

// update foods
app.post('/api/update', (req, res) => {
  FoodMgmt.updateFood(req.body.foodId, req.body.updateDetails).then(data => res.json(data));
});

// delete foods
app.post('/api/delete', (req, res) => {
  FoodMgmt.deleteFood(req.body.foodId).then(data => res.json(data));
});

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../build/index.html'));
});

app.listen(port, () => {
    console.log(`Server listening on the port  ${port}`);
})