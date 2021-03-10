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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
