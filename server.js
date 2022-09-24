require('./model');

const path = require('path');
const express = require('express');
const cors = require('cors');

require('dotenv').config({ path: "./config.env" });

const FoodMgmt = require('./crud/food.mgmt');

const app = express();
const port = process.env.PORT || 3080;

app.use(cors());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, '../build')));
app.use(express.json());

// get foods
app.get('/api/get', (req, res) => {
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

app.listen(port, () => {
    console.log(`Server listening on the port  ${port}`);
})