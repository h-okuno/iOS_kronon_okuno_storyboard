//
//  NextViewController.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/05.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        let attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 16.0), // フォントサイズ：16
            .foregroundColor : UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1) // カラー
          ]
        inputEmailTextFeild.attributedPlaceholder = NSAttributedString(string: "メールアドレス", attributes: attributes)
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        leftPadding.backgroundColor = UIColor.clear
        inputEmailTextFeild.leftView = leftPadding
        inputEmailTextFeild.leftViewMode = .always
        
        inputPasswordTextField.attributedPlaceholder = NSAttributedString(string: "パスワード", attributes: attributes)
        let leftPadding_2 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        leftPadding_2.backgroundColor = UIColor.clear
        inputPasswordTextField.leftView = leftPadding_2
        inputPasswordTextField.leftViewMode = .always
        
        createAccountButton.titleLabel?.adjustsFontSizeToFitWidth = true

    }
    
    @IBOutlet weak var inputEmailTextFeild: UITextField!
    @IBOutlet weak var inputPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBAction func loginButton(_ sender: Any) {
        
        let inputEmail: String = inputEmailTextFeild.text!
        let inputPassword: String = inputPasswordTextField.text!
        loginCheck(email: inputEmail, password: inputPassword)
        
//        self.performSegue(withIdentifier: "toCalendar", sender: self)
    }
    @IBAction func createAccountTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toCreateAccount", sender: self)
        
    }
    
    @IBAction func inputEmail(_ sender: Any) {
    }
    @IBAction func inputPassword(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    func loginCheck(email:String, password:String){
        let baseUrlString = "http://54.64.229.155/api/"
        let searchUrlString = "\(baseUrlString)login"
        let searchUrl = URL(string: searchUrlString)!
        var request = URLRequest(url: searchUrl)
        
        guard let email_encode = email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        guard let password_encode = password.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        
        let params:[String:Any] = [
                    "email": email_encode,
                    "password":password_encode
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
