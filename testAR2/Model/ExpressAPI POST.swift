//
//  ExpressAPI.swift
//  testAR2
//
//  Created by Brayton Lordianto on 9/24/22.
//

import Foundation


class ServerPostHandler {
    private func post(to urlString: String, _ data: FoodItem) {
        guard let url = URL(string: urlString) else{return}
        
        do {
            let data = try? JSONEncoder().encode(data)
            
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            // based on this, it seems to work
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
//                print(String(data: data!, encoding: .utf8)!)
//                print(response ?? "no")
//                print(error ?? "none")
            }
            task.resume()
        }
    }
    
    func addFood(type: ItemType, name: String, quantity: Int, produceDate: Date, expireDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
//        let someDateTime: Date = formatter.date(from: produceDate.description)!
//        let someOtherTime = formatter.date(from: expireDate.description)!

        post(to: "http://127.0.0.1:3080/api/create", FoodItem(classification: type.rawValue, name: name, quantity: quantity, produceDate: produceDate, expireDate: expireDate))
    }
}
