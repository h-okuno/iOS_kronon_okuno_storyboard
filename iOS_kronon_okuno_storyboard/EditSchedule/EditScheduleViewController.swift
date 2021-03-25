//
//  EditScheduleViewController.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/12.
//

import UIKit

class EditScheduleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inputTitle.attributedPlaceholder = NSAttributedString(string: "タイトル", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 81/255, green: 92/255, blue: 111/255, alpha: 0.4)])
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        leftPadding.backgroundColor = UIColor.clear
        inputTitle.leftView = leftPadding
        inputTitle.leftViewMode = .always
        
        // Delegate設定
        inputPlace.delegate = self
        inputPlace.dataSource = self
        
    }
    
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputPlace: UIPickerView!
    @IBAction func okButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toCalendar", sender: self)
    }
    
    @IBAction func inputTitle(_ sender: Any) {
    }
    
    let dataList = [
            "オフィス","在宅","外出"
        ]
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
            navigationItem.title = "予定修正"
            navigationItem.backButtonTitle = "予定詳細"
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
        
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                        titleForRow row: Int,
                        forComponent component: Int) -> String? {
            
        return dataList[row]
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

class TitleTextField: UITextField {

    // 下線用のUIViewを作っておく
    let underline: UIView = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()

        self.frame.size.height = 35

        composeUnderline() // 下線のスタイルセットおよび追加処理
    }

    private func composeUnderline() {
        self.underline.frame = CGRect(
            x: 0,                    // x, yの位置指定は親要素,
            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
            width: self.frame.width,
            height: 2.5)

        self.underline.backgroundColor = UIColor(red: 190/255, green: 187/255, blue: 187/255, alpha: 1)

        self.addSubview(self.underline)
        self.bringSubviewToFront(self.underline)
    }
}
