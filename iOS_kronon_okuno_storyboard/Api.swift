//
//  Api.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/25.
//

import Foundation

//let baseUrlString = "http://54.64.229.155/api/"
//
//func loginCheck(email:String, password:String){
//    let searchUrlString = "\(baseUrlString)login"
//    let searchUrl = URL(string: searchUrlString)!
//    var request = URLRequest(url: searchUrl)
//
//    guard let email_encode = email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
//        return
//    }
//    guard let password_encode = password.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
//        return
//    }
//
//    let params:[String:Any] = [
//                "email": email_encode,
//                "password":password_encode
//            ]
//    guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return }
//
//    request.httpMethod = "POST"
//    request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//    request.httpBody = httpBody
//
//    URLSession.shared.dataTask(with: request) {(data, response, error) in
//
//        let resultData = String(data: data!, encoding: .utf8)!
//
//        if let error = error {
//            print("Failed to get item info: \(error)")
//            return;
//        }
//
//        if let response = response as? HTTPURLResponse {
//            if !(200...299).contains(response.statusCode) {
//                print(resultData)
//                do{
//                    let couponData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: Any]
//                    DispatchQueue.main.async {
//                        self.alert(title: "エラー", message: couponData["message"] as! String)
//                    }
//                }
//                catch {
//                    print(error)
//                }
//                return
//            }
//        }
//
//        if let data = data {
//            do {
//                let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                let success = jsonDict!["success"] as! Bool
////                    var message = jsonDict!["message"] as! String
//
//                if(success) {
//                    print(resultData)
//                    DispatchQueue.main.async {
//                        self.performSegue(withIdentifier: "toCalendar", sender: self)
//                    }
//                }
//            } catch {
//                print("Error parsing the response.")
//            }
//        } else {
//            print("Unexpected error.")
//        }
//
//    }.resume()
//}
