//
//  ExpressAPI GET.swift
//  testAR2
//
//  Created by Brayton Lordianto on 9/24/22.
//
//
//import Foundation
//let str = "http://127.0.0.1:3080/api/get"
//
//guard let url = URL(string: str) else{
//    print("cannot get url")
//    fatalError()
//}
//
//let task = URLSession.shared.dataTask(with: url){
//    data, response, error in
////    print(data, error, response)
//    if let error = error {
////        print(error.localizedDescription)
//    }
//    if let data = data {
//        print(String(data: data, encoding: .utf8))
//    }
//    
//    
//    
//    let aDictionary : NSDictionary? = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
//    
//    if let actualDictionary = aDictionary?["db"] as? NSDictionary {
//        print(actualDictionary.allKeys)
//        print("finished fetching.")
//    }
//    
//    else {
//        print("no ans")
//    }
//}
//
////task.resume()
//
