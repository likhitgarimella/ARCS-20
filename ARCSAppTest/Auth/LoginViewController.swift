//
//  LoginViewController.swift
//  ARCSAppTest
//
//  Created by Likhit Garimella on 11/01/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI
import Alamofire
import SwiftyJSON
import Toast_Swift

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
        
    @IBOutlet weak var passTextField: UITextField!
    
    var activeTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        // Navigation Bar Properties
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        // Setting Delegates
        emailTextField.delegate = self
        passTextField.delegate = self
            
            // Textfield Properties
            emailTextField.layer.cornerRadius = 25
            passTextField.layer.cornerRadius = 25
        
            
            // Create a padding view for padding on LEFT
            emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: emailTextField.frame.height))
            emailTextField.leftViewMode = .always

            passTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: passTextField.frame.height))
            passTextField.leftViewMode = .always
            
            // Create a padding view for padding on RIGHT
            emailTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: emailTextField.frame.height))
            emailTextField.rightViewMode = .always
            
            passTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: passTextField.frame.height))
            passTextField.rightViewMode = .always
        
        self.hideKeyboardWhenTappedAround()
        
        
            // Keyboard Show and Hide
            /* NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil) */ // Undo This
        
        // Keyboard Show and Hide
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        }
    
    // **************************************************************** //
    // **************************************************************** //
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSignUp", sender: self)
        
    }
    
    @IBAction func loginSucess(_ sender: UIButton) {
        
        /*  // 🛑🛑 My Old Code 🛑🛑
         
            // Dismiss keyboard after editing textfields
            emailTextField.resignFirstResponder()
            passTextField.resignFirstResponder()
        
        if (emailTextField.text!.isEmpty || passTextField.text!.isEmpty)
            
        {
            // Alert
            let myAlert = UIAlertController(title: "Alert", message: "All fields are required to fill in!", preferredStyle: UIAlertController.Style.alert)
                        
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
            
        }
        
        self.performSegue(withIdentifier: "goToTimeline", sender: self)
         
            */  // 🛑🛑 My Old Code 🛑🛑
        
        acceptLogin { (success) in
              if success {
                  //    let url2 = "https://register.ieeecsvit.com/api/user/app-profile"    // Old Repo's Url
                //      let url2 = "https://arcsportal20.herokuapp.com/api/user/app-profile"    // New Url
                let url2 = "http://arcsportal19.herokuapp.com/api/user/app-profile"        // Trial Url
                  if let token = UserDefaults.standard.string(forKey: "token") {
                      let header = ["token" : token]
                      
                    Alamofire.request(url2, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
                          .validate()
                          .responseJSON { (response) in
                              
                              print(response)
                              
                              switch response.result {
                                  
                              case .success(let value):
                                  let swiftyjson = JSON(value).object
                                  print("123")
                                  
                                  let array = swiftyjson as? [String: AnyObject]
                                  
                                  if let name = array? ["name"]
                                  {
                                      UserDefaults.standard.set(name, forKey: "name")
                                  }
                                  if let email = array?["email"]
                                  {
                                      UserDefaults.standard.set(email, forKey: "email")
                                  }
                                  if let reg = array?["registration"]
                                  {
                                      UserDefaults.standard.set(reg, forKey: "regno")
                                  }
                                  if let reg = array?["contact"]
                                  {
                                      UserDefaults.standard.set(reg, forKey: "phoneno")
                                  }
                                  
                                  break
                                
                              case .failure(let error):
                                  print(error.localizedDescription)
                                
                            }
                      }
                  }
                  
              } else {
                  print("error")
                  // Toast
              }
          }
        
    }
    
    // **************************************************************** //
    // **************************************************************** //
    
    
    typealias CompletionHandler = (_ success: Bool) -> Void
        func acceptLogin(completionHandler: @escaping CompletionHandler) {
            
            if self.emailTextField.text?.isEmpty == false && self.passTextField.text?.isEmpty == false {
                
                // let url = "https://register.ieeecsvit.com/api/login"     // Old Repo's Url
                // let url = "https://arcsportal20.herokuapp.com/api/login"     // New Url
                let url = "http://arcsportal19.herokuapp.com/api/login"     // Trial Url
                print(url)
                
               
                self.view.makeToast("Please wait..")
                let parameters: [String: Any] = [
                    "email": self.emailTextField.text!,
                    "password": self.passTextField.text!
                ]
                
                print(parameters)
                
                Alamofire.request(URL(string: url)!, method: .post, parameters: parameters, headers: nil)
                    .responseJSON { (response) in
                        
                        switch response.result {
                        case .success(let value):
                            let json = JSON(value)
                            print(json)
                            let stringValue = json["success"].rawString()
                            
                            if stringValue == "true" {
                                
                                let headerJson = JSON(response.response?.allHeaderFields as Any)
                                if let token = headerJson["token"].rawString()
                                {
                                    UserDefaults.standard.set(token,forKey:"token")
                                }
                                
                                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                                self.performSegue(withIdentifier: "loginSuccess", sender: self)
                                
                                print(headerJson)
                            }
                                
                            else if json["message"].rawString() == "User already registered" {
                                let message = json["message"].rawString()
                                let alertController = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true, completion: nil)
                                print("hellothere")
                            }
                                
                            else {
                                let message = json["message"].rawString()
                                let alertController = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true, completion: nil)
                            }
                            
                            completionHandler(true)
                            break
                            
                    case .failure(let error):
                        print(error)
                        completionHandler(false)
                            
                        }
                        
                }
                
            } else {
                let alertController = UIAlertController(title: "Oops", message: "Please enter all the fields", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    
    // **************************************************************** //
    // **************************************************************** //
    
    
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
