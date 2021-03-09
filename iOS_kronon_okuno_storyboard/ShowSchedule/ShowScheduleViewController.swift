//
//  ShowScheduleViewController.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/09.
//

import UIKit

class ShowScheduleViewController: UIViewController {
    
    var createScheduleButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UITabBar.appearance().tintColor = UIColor(red: 222/255, green: 155/255, blue: 80/255, alpha: 1)
        createScheduleButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(createScheduleButtonTapped(_:)))
    }
    
    @IBAction func createScheduleButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toCreateSchedule", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tabBarController?.title = "予定表"
            tabBarController?.navigationItem.hidesBackButton = true
            tabBarController?.navigationItem.rightBarButtonItems = [createScheduleButton]
            tabBarController?.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
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
