//
//  SignUpViewController.swift
//  ARCSAppTest
//
//  Created by Likhit Garimella on 13/01/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI
import Alamofire
import SwiftyJSON
import Toast_Swift

class SignUpViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet var phoneNoTextField: UITextField!
    
    @IBOutlet var gender00: DropDown!
    
    @IBOutlet var emailId: UITextField!
    
    @IBOutlet weak var pass2TextField: UITextField!
    
    @IBOutlet var confirmPass: UITextField!
    
    @IBOutlet var tShirtSize: DropDown!
    
    @IBOutlet var membershipNo: UITextField!
    
    @IBOutlet var section: UITextField!
    
    @IBOutlet var vitian: UISwitch!
    
    @IBOutlet var university: UITextField!
    
    @IBOutlet var regNo: UITextField!
    
    @IBOutlet var roomNo: UITextField!
    
    var activeTextField : UITextField!
    var reachability : Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gender00.optionArray=["Male","Female","Other"]
        gender00.selectedRowColor=UIColor(red:0.98, green:0.64, blue:0.10, alpha:1.0)
        // Thread 1: EXC_BAD_ACCESS ⬆️⬇️
        tShirtSize.optionArray=["XS","S","M","L","XL","XXL"]
        tShirtSize.selectedRowColor=UIColor(red:0.98, green:0.64, blue:0.10, alpha:1.0)
        
        
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        // Navigation Bar Properties
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        // Drop Down Properties
        DropDown.appearance().textColor = UIColor.black
        // DropDown.appearance().selectedTextColor = UIColor.black
        // DropDown.appearance().selectionBackgroundColor = UIColor.white
        
        
        regNo.isHidden = true
        roomNo.isHidden = true
        
        // **************************************************************** //
        
        // Setting Delegates
        fullNameTextField.delegate = self
        pass2TextField.delegate = self
        phoneNoTextField.delegate = self
        emailId.delegate = self
        confirmPass.delegate = self
        membershipNo.delegate = self
        section.delegate = self
        university.delegate = self
        regNo.delegate = self
        roomNo.delegate = self
        
        
        // Textfield Properties
        fullNameTextField.layer.cornerRadius = 25
        pass2TextField.layer.cornerRadius = 25
        phoneNoTextField.layer.cornerRadius = 25
        gender00.layer.cornerRadius = 25
        emailId.layer.cornerRadius = 25
        confirmPass.layer.cornerRadius = 25
        tShirtSize.layer.cornerRadius = 25
        membershipNo.layer.cornerRadius = 25
        section.layer.cornerRadius = 25
        university.layer.cornerRadius = 25
        regNo.layer.cornerRadius = 25
        roomNo.layer.cornerRadius = 25
        
        
        // Create a padding view for padding on LEFT
        fullNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: fullNameTextField.frame.height))
        fullNameTextField.leftViewMode = .always
        
        pass2TextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: pass2TextField.frame.height))
        pass2TextField.leftViewMode = .always
        
        phoneNoTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: phoneNoTextField.frame.height))
        phoneNoTextField.leftViewMode = .always
        
        // DropDown
        gender00.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: gender00.frame.height))
        gender00.leftViewMode = .always
        //
        
        emailId.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: emailId.frame.height))
        emailId.leftViewMode = .always
        
        confirmPass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: confirmPass.frame.height))
        confirmPass.leftViewMode = .always
        
        // DropDown
        tShirtSize.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: tShirtSize.frame.height))
        tShirtSize.leftViewMode = .always
        //
        
        membershipNo.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: membershipNo.frame.height))
        membershipNo.leftViewMode = .always
        
        section.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: section.frame.height))
        section.leftViewMode = .always
        
        university.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: university.frame.height))
        university.leftViewMode = .always
        
        regNo.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: regNo.frame.height))
        regNo.leftViewMode = .always
        
        roomNo.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: roomNo.frame.height))
        roomNo.leftViewMode = .always
        
        
        // Create a padding view for padding on RIGHT
        fullNameTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: fullNameTextField.frame.height))
        fullNameTextField.rightViewMode = .always
        
        pass2TextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: pass2TextField.frame.height))
        pass2TextField.rightViewMode = .always
        
        phoneNoTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: phoneNoTextField.frame.height))
        phoneNoTextField.rightViewMode = .always
        
        emailId.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: emailId.frame.height))
        emailId.rightViewMode = .always
        
        confirmPass.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: emailId.frame.height))
        confirmPass.rightViewMode = .always
        
        membershipNo.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: membershipNo.frame.height))
        membershipNo.rightViewMode = .always
        
        section.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: section.frame.height))
        section.rightViewMode = .always
        
        university.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: university.frame.height))
        university.rightViewMode = .always
        
        regNo.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: regNo.frame.height))
        regNo.rightViewMode = .always
        
        roomNo.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: roomNo.frame.height))
        roomNo.rightViewMode = .always
        
        self.hideKeyboardWhenTappedAround()
        
        
        // **************************************************************** //
        
        // Keyboard Show and Hide
        /* NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil) */ // Undo This
        
        // Keyboard Show and Hide
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        }
    
    @IBAction func switchVitian(_ sender: UISwitch) {
        
        if vitian.isOn==true {
            regNo.isHidden=false
            roomNo.isHidden=false
            university.text="VIT Vellore"
            university.isEnabled=false
        }
        if vitian.isOn==false {
                regNo.isHidden=true
                regNo.text=""
                roomNo.isHidden=true
                roomNo.text=""
                university.text=""
                university.isEnabled=true
            }
        
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goBackToLogin", sender: self)
        
    }
    
    // 🛑🛑🛑🛑
    // **************************************************************** //
    // **************************************************************** //
    
    func acceptSignUp() {
            
        func isValidEmail(testStr:String) -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: testStr)
            }
        
        if (self.emailId.text?.isEmpty == false && self.pass2TextField.text?.isEmpty == false && self.confirmPass.text?.isEmpty == false && self.phoneNoTextField.text?.isEmpty == false && self.fullNameTextField.text?.isEmpty == false && self.tShirtSize.text?.isEmpty == false && self.university.text?.isEmpty == false && vitian.isOn == false) || (self.emailId.text?.isEmpty == false && self.pass2TextField.text?.isEmpty == false && self.confirmPass.text?.isEmpty == false && self.phoneNoTextField.text?.isEmpty == false && self.fullNameTextField.text?.isEmpty == false && self.tShirtSize.text?.isEmpty == false && self.university.text?.isEmpty == false && vitian.isOn == true && regNo.text?.isEmpty == false && roomNo.text?.isEmpty == false) {
            
            if self.pass2TextField.text == self.confirmPass.text {
                
                if (membershipNo.text?.isEmpty == true && section.text?.isEmpty == true) || (membershipNo.text?.isEmpty == false && section.text?.isEmpty == false) {
                    
                    if(isValidEmail(testStr: self.emailId.text!)) {
                    
                    if(self.phoneNoTextField.text?.count == 10) {
                        self.view.makeToast("Please wait..")
                    
                // let url = "https://register.ieeecsvit.com/api/register-ios"      // Old Repo's Url
                // let url = "https://arcsportal20.herokuapp.com/api/register-ios"     // New Url
                let url = "http://arcsportal19.herokuapp.com/api/register-ios"     // Trial Url
                print(url)
                
                let parameters: [String: Any] = [
                    
                    "name": self.fullNameTextField.text!,
                    "contact": self.phoneNoTextField.text!,
                    "gender": self.gender00.text!,
                    "email": self.emailId.text!,
                    "password": self.pass2TextField.text!,
                    "tShirtSize": self.tShirtSize.text!,
                    "memberno": self.membershipNo.text!,
                    "section": self.section.text!,
                    "university": self.university.text!,
                    "registration": self.regNo.text!,
                    "room": self.roomNo.text!,
                    
                ]
                
                print(parameters)
                
                Alamofire.request(URL(string: url)!, method: .post, parameters: parameters, headers: nil)
                    .responseJSON { (response) in
                    print(response)
                        
                        switch response.result {
                        case .success(let value):
                            let json = JSON(value)
                            print(json)
                            let stringValue = json["success"].rawString()
                            
                            if stringValue == "true" {
                                
                                self.performSegue(withIdentifier: "registerSuccess", sender: self)
                                self.view.makeToast("Registration Successful. Login to Continue")
                    
                            } else {
                                // let message = json["message"].rawString()
                                
                                let message = json["error"].rawString()
                                let alertController = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true, completion: nil)
                            }
                            break
                            
                            case .failure(let error):
                            print(error)
                            
                        }
                        
                        }
                    } else {
                        self.view.makeToast("Mobile Number Should be 10 digits")
                    }
                        
                    } else {
                        self.view.makeToast("Enter Valid Email address")
                    }
                    
                    } else {
                        self.view.makeToast("Enter both IEEE member number and section, else leave both empty")
                    }
                
                    } else {
                        self.view.makeToast("Password and Confirm Password doesn't match")
                    }
            
                } else {
            
                let alertController = UIAlertController(title: "Oops", message: "Please fill all the fields to proceed", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    
    // **************************************************************** //
    // **************************************************************** //
    // 🛑🛑🛑🛑
    
    
    @IBAction func signUpSuccess(_ sender: UIButton) {
        
        acceptSignUp()
        
        // Dismiss keyboard after editing textfields
        // fullNameTextField.resignFirstResponder()
        // username2TextField.resignFirstResponder()
        // pass2TextField.resignFirstResponder()
        
        // **************************************************************** //
        
        /* if (fullNameTextField.text! != "" && username2TextField.text! != "" && pass2TextField.text! != "")
        {
            // Call Api
        }
        // if (fullNameTextField.text!.isEmpty || username2TextField.text!.isEmpty || pass2TextField.text!.isEmpty)
            
        else
        {
            // Alert
            let myAlert = UIAlertController(title: "Alert", message: "All fields are required to fill in!", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
        } */ // Later Undo This
        
        // **************************************************************** //
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }

    @objc func keyboardWillHide(notification: NSNotification) {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    
        // **************************************************************** //
        
        /* @objc func keyboardWillShow(notification: NSNotification)
        {
            guard let userInfo = notification.userInfo
            else {return}
            
            guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
            else {return}
            
            let keyboardFrame = keyboardSize.cgRectValue
            if self.view.frame.origin.y == 0
            {
                self.view.frame.origin.y -= keyboardFrame.height
            }
        } */ // Undo This
        
        /* @objc func keyboardWillHide(notification: NSNotification)
        {
            if self.view.frame.origin.y != 0
            {
                self.view.frame.origin.y += 0
            }
        } */ // Undo This
    
        // **************************************************************** //
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // **************************************************************** //
    // **************************************************************** //
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // Dismiss keyboard on tapping anywhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        view.endEditing(true)
    }
    
    // Dismiss keyboard on tapping next/return button on keyboard
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

}

// Dismiss keyboard on tapping anywhere
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
