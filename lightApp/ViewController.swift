//
//  ViewController.swift
//  lightApp
//
//  Created by 維衣 on 2022/8/2.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var numTextField: UITextField!
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
        
        numTextField.delegate = self
        numTextField.keyboardType = .numberPad
        addTapGesture()
        addDoneBtn()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func showColor(_ sender: UIButton) {
        hiddenView.isHidden = false
        labels[2].text = (numTextField.text!.isEmpty ?  "還沒輸入數字" : nil)
        
    }
    
    @IBAction func inputColor(_ sender: UIButton) {
        hiddenView.isHidden = false
        saveInt = Int(numTextField.text!) ?? 0
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
                changeColor(colorString: saveColorStr)
                break
            }else{
                self.labels[2].text = "答錯了!!"
                changeColor(colorString: saveColorStr)
            }
//            changeColor(colorString: numerologys[i].numerologyValue)
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
        numTextField.inputAccessoryView = toolBar
    }
    @objc func doneBtnPressed() {
            view.endEditing(true)
        }
    func changeColor(colorString color: String) {
        
//        var labelsBackgroundColor = UIColor()
        
        switch color{
            
            case "紅" : labels[2].backgroundColor = UIColor(red: 203/255, green: 138/255, blue: 144/255, alpha: 0.85)
//            print("**F-1 labels[2].backgroundColor == \(labels[2].backgroundColor! )")
            case "橙" : labels[2].backgroundColor = UIColor(red: 246/255, green: 185/255, blue: 157/255, alpha: 0.85)
            print("**F-2 labels[2].backgroundColor == \(labels[2].backgroundColor!)")
            case "黃" : labels[2].backgroundColor = UIColor(red: 254/255, green: 225/255, blue: 212/255, alpha: 0.85)
            case "綠" : labels[2].backgroundColor = UIColor(red: 177/255, green: 211/255, blue: 197/255, alpha: 0.85)
            case "藍" : labels[2].backgroundColor = UIColor(red: 131/255, green: 177/255, blue: 201/255, alpha: 0.85)
            case "靛" : labels[2].backgroundColor = UIColor(red: 215/255, green: 226/255, blue: 247/255, alpha: 0.85)
            case "紫" : labels[2].backgroundColor = UIColor(red: 181/255, green: 127/255, blue: 179/255, alpha: 0.85)
            case "粉" : labels[2].backgroundColor = UIColor(red: 238/255, green: 184/255, blue: 184/255, alpha: 0.85)
            case "白" : labels[2].backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.85)
        default:
            break
        }
//        print("**labelsBackgroundColor == \(labelsBackgroundColor)")
//        return labelsBackgroundColor
    }
}
