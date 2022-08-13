//
//  ViewController.swift
//  lightApp
//
//  Created by 維衣 on 2022/8/2.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var numString: UITextField!
    @IBOutlet weak var colorBtn: UIButton!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet var colorButtons: [UIButton]!
    
    var saveInt:Int = 0
    var saveColorStr = ""
    var ansText = "＊＊"
    var n:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        hiddenView.isHidden = true
        
        for i in 0...colorButtons.count - 1{
            colorButtons[i].setTitle("\(numerologys[i].numerologyValue)", for: .normal)
        }
        
        numString.delegate = self
        numString.keyboardType = .numberPad
        addTapGesture()
        addDoneBtn()
        
    }
    
    @IBAction func showColor(_ sender: UIButton) {
        hiddenView.isHidden = false
        labels[2].text = (numString.text!.isEmpty ?  "還沒輸入數字" : nil)
    }
    
    @IBAction func inputColor(_ sender: UIButton) {
        hiddenView.isHidden = false
        saveInt = Int(numString.text!) ?? 0
        saveColorStr = sender.titleLabel!.text!
        hiddenView.isHidden = true
        printAns(saveInt, saveColorStr)
    }

    func addTapGesture(){
            let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            view.addGestureRecognizer(tap)
        }
    
    @objc private func hideKeyboard(){
            self.view.endEditing(true)
        }
    
    func printAns( _ saveInt: Int, _ saveColorStr: String){
        ansText = ""
        
        for (i,_) in numerologys.enumerated(){
            if (i + 1 == saveInt) && ("\(numerologys[i].numerologyValue)" == saveColorStr) {
                self.labels[2].text = "答對了!!"
                break
            }else{
                self.labels[2].text = "答錯了!!"
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func addDoneBtn() {
        
        let toolBar = UIToolbar()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done,
                                      target: self,
                                      action: #selector(doneBtnPressed))
        // push done btn to right   不加的話Button會在toobar左邊
        let flexibeSpace = UIBarButtonItem(
                                     barButtonSystemItem:.flexibleSpace,
                                     target: nil,
                                     action: nil)
        toolBar.sizeToFit() //如果沒加這行toolBar不會出來，DoneBtn也不能按
        toolBar.setItems([flexibeSpace,doneBtn], animated: false)
        numString.inputAccessoryView = toolBar
    }
    @objc func doneBtnPressed() {
            view.endEditing(true)
        }
    
}
