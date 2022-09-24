//
//  ItemModel.swift
//  testAR2
//
//  Created by Brayton Lordianto on 9/23/22.
//

import Foundation

enum ItemType : String, CaseIterable {
    case strawberry = "strawberry"
    case apple = "apple"
    case orange = "orange"
    case grape = "grape"
    case bananas = "bananas"
    case other = "other"
}

var globalArray: [ItemType] = [.bananas, .strawberry]

struct TestItem: Codable, Identifiable {
    let classification: String
    let id: UUID
    let name: String
    let quantity: Int
    let produceDate: Date
    let expireDate: Date
    
    init(classification: String, name: String, quantity: Int, produceDate: Date, expireDate: Date) {
        self.id = UUID()
        self.name = name
        self.quantity = quantity
        self.produceDate = produceDate
        self.expireDate = expireDate
        self.classification = classification
    }
}

struct FoodItem: Codable, Identifiable {
    let food: TestItem
    let id = UUID()
    init(classification: String, name: String, quantity: Int, produceDate: Date, expireDate: Date) {
        self.food = TestItem(classification: classification, name: name, quantity: quantity, produceDate: produceDate, expireDate: expireDate)
    }
}
//
//let task = URLSession.shared.dataTask(with: url){
//    data, response, error in
////    print(data, error, response)
//    if let error = error {
////        print(error.localizedDescription)
//    }
//    if let data = data {
//        let array : NSArray = try! (JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray)
//        completion(array: array)
//    }
//}
//
//var foodItems = [FoodItem]()
//func completion(array: NSArray) {
//    for i in 0..<array.count {
//        let dict = array[i] as! NSDictionary
//        foodItems.append(FoodItem(classification: dict["classification"] as! String, name: dict["name"] as! String, quantity: dict["quantity"] as! Int, produceDate: dict["produceDate"] as! Date, expireDate: dict["expireDate"] as! Date))
//        print(foodItems)
//    }
//}
