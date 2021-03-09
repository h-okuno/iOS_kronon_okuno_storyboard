//
//  ViewController.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/02/17.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 16)
        topButton.titleLabel?.adjustsFontSizeToFitWidth = true
        topButton.titleLabel?.numberOfLines = 1
        topButton.titleLabel?.minimumScaleFactor = 0.1
        topButton.clipsToBounds = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    } 

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var topButton: UIButton!
    @IBAction func tapStartButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    
    
    
    
    
}

