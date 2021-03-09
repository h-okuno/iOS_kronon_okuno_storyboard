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
        inputEmail.attributedPlaceholder = NSAttributedString(string: "メールアドレス", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)])
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        leftPadding.backgroundColor = UIColor.clear
        inputEmail.leftView = leftPadding
        inputEmail.leftViewMode = .always
        
        inputPassword.attributedPlaceholder = NSAttributedString(string: "パスワード", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)])
        let leftPadding_2 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        leftPadding_2.backgroundColor = UIColor.clear
        inputPassword.leftView = leftPadding_2
        inputPassword.leftViewMode = .always

    }
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
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
