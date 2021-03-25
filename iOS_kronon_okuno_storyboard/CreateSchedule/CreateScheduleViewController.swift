//
//  CreateScheduleViewController.swift
//  iOS_kronon_okuno_storyboard
//
//  Created by 奥野博貴 on 2021/03/09.
//

import UIKit

class CreateScheduleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var pickerView: UIPickerView = UIPickerView()
    //datePickerのプロパティを作る
    var startTimePickerView  : UIDatePicker = UIDatePicker()
    var endTimePickerView : UIDatePicker = UIDatePicker()
    var datePickerView : UIDatePicker = UIDatePicker()
    let dataList = [
            "オフィス","在宅","外出"
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 16.0), // フォントサイズ：16
            .foregroundColor : UIColor(red: 81/255, green: 92/255, blue: 111/255, alpha: 0.4) // カラー
          ]
        inputTitle.attributedPlaceholder = NSAttributedString(string: "タイトル", attributes: attributes)
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        leftPadding.backgroundColor = UIColor.clear
        inputTitle.leftView = leftPadding
        inputTitle.leftViewMode = .always
        
        // ピッカー設定
        pickerView.delegate = self
        pickerView.dataSource = self
                
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
                toolbar.setItems([spacelItem, doneItem], animated: true)
                
        // インプットビュー設定
        inputPlace.inputView = pickerView
        inputPlace.inputAccessoryView = toolbar

        makeDatePickerKeybord()
        makeStartTimePickerKeybord()
        makeEndTimePickerKeybord()
    }
    
    
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputPlace: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBAction func tapOkButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toCalendar", sender: self)
    }
    
    @IBAction func inputTitle(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
            tabBarController?.title = "予定登録"
        
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
    
    // 決定ボタン押下
    @objc func done() {
        inputPlace.endEditing(true)
        inputPlace.text = "\(dataList[pickerView.selectedRow(inComponent: 0)])"
    }
    
    //キーボードの設定
    func makeStartTimePickerKeybord(){
        startTimePickerView.preferredDatePickerStyle = UIDatePickerStyle.wheels
        // 日付ピッカーをキーボードにする設定
        startTimePickerView.datePickerMode = UIDatePicker.Mode.time
        startTimePickerView.timeZone = TimeZone(identifier: "Asia/Tokyo")
        startTimePickerView.locale = Locale(identifier: "ja_JP")
        startTimePickerView.minuteInterval = 15
        startTimePickerView.addTarget(self, action: #selector(self.startTimeChange), for: .valueChanged)
        startTimeTextField.inputView = startTimePickerView
        startTimeTextField.delegate = self
    }
    
    func makeEndTimePickerKeybord(){
        endTimePickerView.preferredDatePickerStyle = UIDatePickerStyle.wheels
        // 日付ピッカーをキーボードにする設定
        endTimePickerView.datePickerMode = UIDatePicker.Mode.time
        endTimePickerView.timeZone = TimeZone(identifier: "Asia/Tokyo")
        endTimePickerView.locale = Locale(identifier: "ja_JP")
        endTimePickerView.minuteInterval = 15
        endTimePickerView.addTarget(self, action: #selector(self.endTimeChange), for: .valueChanged)
        endTimeTextField.inputView = endTimePickerView
        endTimeTextField.delegate = self
    }
    
    func makeDatePickerKeybord(){
        datePickerView.preferredDatePickerStyle = UIDatePickerStyle.wheels
        // 日付ピッカーをキーボードにする設定
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.timeZone = TimeZone(identifier: "Asia/Tokyo")
        datePickerView.locale = Locale(identifier: "ja_JP")
        datePickerView.minuteInterval = 15
        datePickerView.addTarget(self, action: #selector(self.dateChange), for: .valueChanged)
        dateTextField.inputView = datePickerView
        dateTextField.delegate = self
    }
    
    //datePickerが変化すると呼ばれる
    @objc func startTimeChange(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        startTimeTextField.text = "\(formatter.string(from: startTimePickerView.date))"
    }
    
    @objc func endTimeChange(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        endTimeTextField.text = "\(formatter.string(from: endTimePickerView.date))"
    }
    
    @objc func dateChange(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        dateTextField.text = "\(formatter.string(from: datePickerView.date))"
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

class CustomTextField: UITextField {

    // 下線用のUIViewを作っておく
    let underline: UIView = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()

        self.frame.size.height = 25

        composeUnderline() // 下線のスタイルセットおよび追加処理
    }

    private func composeUnderline() {
        self.underline.frame = CGRect(
            x: 0,                    // x, yの位置指定は親要素,
            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
            width: self.frame.width,
            height: 2)

        self.underline.backgroundColor = UIColor(red: 190/255, green: 187/255, blue: 187/255, alpha: 0.8)

        self.addSubview(self.underline)
        self.bringSubviewToFront(self.underline)
    }
}

class DoneTextFierd: UITextField{

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit(){
        let tools = UIToolbar()
        tools.frame = CGRect(x: 0, y: 0, width: frame.width, height: 40)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let closeButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.closeButtonTapped))
        tools.items = [spacer, closeButton]
        self.inputAccessoryView = tools
    }

    @objc func closeButtonTapped(){
        self.endEditing(true)
        self.resignFirstResponder()
    }
}
