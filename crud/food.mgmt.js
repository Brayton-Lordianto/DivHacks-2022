const { connect, disconnect } = require('../config/conn');
const { Food } = require('../model');

class FoodMgmt {

    constructor() {
        connect();
    }

    async getFoods() {
        const food = await Food.find();
        console.log('get foods:::', food);
        return food;
    }

    async createFood(food) {
        let data = {};
        try {
            data = await new Food({ 
                name: food.name, 
                quantity: food.quantity, 
                produceDate: food.produceDate, 
                expireDate: food.expireDate 
            }).save();
            console.log('create foods:::', data);
        } catch(err) {
            console.log('Error::' + err);
        }
        return data;
    }

    async deleteFood(foodId) {
        const food = await Food.deleteOne({ _id: foodId });
        console.log('delete foods:::', food);
        return food;
    }

    async updateFood(foodId, updateDetails) {
        let data = {};
        try {
            data = await Food.updateOne({ _id: foodId }, 
                { $set: { 
                    name: updateDetails.name,
                    quantity: updateDetails.quantity,
                    produceDate: updateDetails.produceDate, 
                    expireDate: updateDetails.expireDate, 
                }
            });
            console.log('update foods:::', data);
        } catch(err) {
            console.log('Error::' + err);
        }
        return data;
    }

}

module.exports = new FoodMgmt();