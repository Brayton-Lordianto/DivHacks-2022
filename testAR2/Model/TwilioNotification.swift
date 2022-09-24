////
////  TwilioNotification.swift
////  testAR2
////
////  Created by Brayton Lordianto on 9/24/22.
////
//
//import Foundation
//import Alamofire
//
//
//func sendTwilioMessage(_ msg: String) {
//
//    let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages"
//    let parameters = ["From": "+19344511293", "To": "+15416567570", "Body": msg]
//
//    AF.request(url, method: .post, parameters: parameters)
//        .authenticate(username: accountSID, password: authToken)
//        .responseJSON { response in
//            debugPrint(response)
//        }
//
//    RunLoop.main.run()
//
//}
