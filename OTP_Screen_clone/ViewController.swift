//
//  ViewController.swift
//  OTP_Screen_clone
//
//  Created by Gokul Gopalakrishnan on 07/12/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var StackViewOTP: UIStackView!
    
    @IBOutlet weak var textView1: UITextField!
    @IBOutlet weak var textView2: UITextField!
    @IBOutlet weak var textView3: UITextField!
    @IBOutlet weak var textView4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        textView1.becomeFirstResponder()
        
        textView1.keyboardType = .numberPad
        textView2.keyboardType = .numberPad
        textView3.keyboardType = .numberPad
        textView4.keyboardType = .numberPad
        
        self.textView1.delegate = self
        self.textView2.delegate = self
        self.textView3.delegate = self
        self.textView4.delegate = self
     
    }
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           if ((textField.text?.count)! < 1 ) && (string.count > 0) {
               if textField == textView1 {
                   textView2.becomeFirstResponder()
               }
               
               if textField == textView2 {
                   textView3.becomeFirstResponder()
               }
               
               if textField == textView3 {
                   textView4.becomeFirstResponder()
               }
               
               if textField == textView4 {
                   textView4.resignFirstResponder()
                   
                   setAlert(StringText: (textView1.text ?? "0") + (textView2.text ?? "0") + (textView3.text ?? "0") + string)
               }
               
               textField.text = string
               return false
           } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
               if textField == textView2 {
                   textView1.becomeFirstResponder()
               }
               if textField == textView3 {
                   textView2.becomeFirstResponder()
               }
               if textField == textView4 {
                   textView3.becomeFirstResponder()
               }
               if textField == textView1 {
                   textView1.resignFirstResponder()
               }
               
               textField.text = ""
               return false
           } else if (textField.text?.count)! >= 1 {
               textField.text = string
               if textField == textView2 {
                   textView3.becomeFirstResponder()
               }
               if textField == textView3 {
                   textView4.becomeFirstResponder()
               }
               if textField == textView4 {
                   textView4.resignFirstResponder()
                   setAlert(StringText: (textView1.text ?? "0") + (textView2.text ?? "0") + (textView3.text ?? "0") + string)
               }
               if textField == textView1 {
                   textView2.becomeFirstResponder()
               }
               return false
           }
           return true
       }
    
    func setAlert(StringText: String) {
       
        if StringText == "1234" {
            let alert = UIAlertController(title: "Congrats", message: "secret message found", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click to close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Try Again", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click to Try again", style: UIAlertAction.Style.default, handler: {_ in
                self.textView1.text = ""
                self.textView2.text = ""
                self.textView3.text = ""
                self.textView4.text = ""
                self.textView1.becomeFirstResponder()
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

