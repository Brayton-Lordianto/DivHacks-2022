//
//  ViewModelForItem.swift
//  testAR2
//
//  Created by Brayton Lordianto on 9/24/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var items =  [FoodItem(classification: "orange", name: "orange", quantity: 1, produceDate: Date(), expireDate: Date()),FoodItem(classification: "grape", name: "my grape", quantity: 1, produceDate: Date(), expireDate: Date()),FoodItem(classification: "bananas", name: "bananas", quantity: 1, produceDate: Date(), expireDate: Date())]
    init() {
//        load(items)
    }
}

func load(_ items: [FoodItem]) {
    let task = URLSession.shared.dataTask(with: URL(string: "http://127.0.0.1:3080/api/get")!) {
        data, response, error in
        //    print(data, error, response)
        if let error = error {
            //        print(error.localizedDescription)
        }
        if let data = data {
            let array : NSArray = try! (JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray)
            completion(array: array, items)
        }
    }
    task.resume()
}

var foodItems = [FoodItem]()
func completion(array: NSArray, _ items: [FoodItem]) {
    for i in 0..<array.count {
        let dict = array[i] as! NSDictionary
        print("t2")
//        let prd = dict["produceDate"] as! Date
        print("test")
        foodItems.append(FoodItem(classification: dict["classification"] as! String, name: dict["name"] as! String, quantity: dict["quantity"] as! Int, produceDate: Date(), expireDate: Date()))
    }
    print(foodItems)
}
