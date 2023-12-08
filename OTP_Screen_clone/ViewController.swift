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
               return false
           }
           
           return true
       }
}

