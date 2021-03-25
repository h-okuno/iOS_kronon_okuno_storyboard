//
//  AccountViewController.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/09.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    let leftPaddingName = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
    let leftPaddingEmail = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
    let leftPaddingPassword = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
    let leftPaddingConfPassword = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inputName.attributedPlaceholder = NSAttributedString(string: "表示名", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 92/255, green: 90/255, blue: 90/255, alpha: 0.6)])
        leftPaddingName.backgroundColor = UIColor.clear
        inputName.leftView = leftPaddingName
        inputName.leftViewMode = .always
        
        inputEmail.attributedPlaceholder = NSAttributedString(string: "メールアドレス", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 92/255, green: 90/255, blue: 90/255, alpha: 0.6)])
        leftPaddingEmail.backgroundColor = UIColor.clear
        inputEmail.leftView = leftPaddingEmail
        inputEmail.leftViewMode = .always
        
        inputPassword.attributedPlaceholder = NSAttributedString(string: "パスワード", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 92/255, green: 90/255, blue: 90/255, alpha: 0.6)])
        leftPaddingPassword.backgroundColor = UIColor.clear
        inputPassword.leftView = leftPaddingPassword
        inputPassword.leftViewMode = .always

        inputConfPassword.attributedPlaceholder = NSAttributedString(string: "パスワード確認", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 92/255, green: 90/255, blue: 90/255, alpha: 0.6)])
        leftPaddingConfPassword.backgroundColor = UIColor.clear
        inputConfPassword.leftView = leftPaddingConfPassword
        inputConfPassword.leftViewMode = .always
    }
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputConfPassword: UITextField!
    @IBAction func registerNewAccountTapped(_ sender: Any) {
        
        let name: String = inputName.text!
        let email: String = inputEmail.text!
        let password: String = inputPassword.text!
        let confPassword: String = inputConfPassword.text!
        CreateAccountCheck(name: name, email: email, password: password, confPassword: confPassword)
        
    }
    
    
    @IBAction func inputName(_ sender: Any) {
    }
    @IBAction func inputEmail(_ sender: Any) {
    }
    @IBAction func inputPassword(_ sender: Any) {
    }
    @IBAction func inputConfPassword(_ sender: Any) {
    }
    
    func CreateAccountCheck(name:String, email:String, password:String, confPassword:String){
        let baseUrlString = "http://54.64.229.155/api/"
        let searchUrlString = "\(baseUrlString)users"
        let searchUrl = URL(string: searchUrlString)!
        var request = URLRequest(url: searchUrl)
        
        guard let name_encode = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        guard let email_encode = email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        guard let password_encode = password.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        
        let params:[String:Any] = [
            "name": name_encode,
            "email": email_encode,
            "password":password_encode,
                ]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return }
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            let resultData = String(data: data!, encoding: .utf8)!

            if let error = error {
                print("Failed to get item info: \(error)")
                return;
            }
            
            if let response = response as? HTTPURLResponse {
                if !(200...299).contains(response.statusCode) {
                    print(resultData)
                    do{
                        let couponData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: Any]
                        DispatchQueue.main.async {
                            self.alert(title: "エラー", message: couponData["message"] as! String)
                        }
                    }
                    catch {
                        print(error)
                    }
                    return
                }
            }
            
            if let data = data {
                do {
                    let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let success = jsonDict!["success"] as! Bool
//                    var message = jsonDict!["message"] as! String
                    
                    if(success) {
                        print(resultData)
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "toCalendar", sender: self)
                        }
                    }
                } catch {
                    print("Error parsing the response.")
                }
            } else {
                print("Unexpected error.")
            }

        }.resume()
    }
    
    var alertController: UIAlertController!
    
    func alert(title:String, message:String) {
        alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: nil))
        present(alertController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
