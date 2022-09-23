const mongoose = require('mongoose')

const FoodSchema = new mongoose.Schema({
	name: { type: String, required: true },
	quantity: { type: Number, required: true },
	expireDate:  { type: Date, required: true },
	produceDate:  { type: Date, required: true },
});

const Food = mongoose.model('Food', FoodSchema);

module.exports = {
    Food
}