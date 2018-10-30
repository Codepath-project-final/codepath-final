//
//  RegistrationViewController.swift
//  Parq
//
//  Created by Preston on 10/15/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self as? UITextFieldDelegate
        emailTextField.delegate = self as? UITextFieldDelegate
        passwordTextField.delegate = self as? UITextFieldDelegate
        confirmPasswordTextField.delegate = self as? UITextFieldDelegate
        firstNameTextField.delegate = self as? UITextFieldDelegate
        lastNameTextField.delegate = self as? UITextFieldDelegate
        
        usernameTextField.placeholder = "Username"
        emailTextField.placeholder = "Email Address"
        passwordTextField.placeholder = "Password"
        confirmPasswordTextField.placeholder = "Confrim Password"
        firstNameTextField.placeholder = "First Name"
        lastNameTextField.placeholder = "Last Name"
        print("got here 1")
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func register(_ sender: Any) {
//        let newUser = PFUser()
//
//        newUser.username = usernameTextField.text
//        newUser.password = passwordTextField.text
//
//        newUser.signUpInBackground { (success: Bool
//            , error: Error?) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print("User Registered successfully")
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            }
//        }
        
        registerUser(usernameTextField.text, passwordTextField.text, firstNameTextField.text, lastNameTextField.text, emailTextField.text)
    }
    
    func registerUser(_ username: String!, _ password: String!, _ firstname: String!, _ lastname: String!, _ email: String!) {
        
        let url = URL(string: "https://parkistan.herokuapp.com/register")!
        
        var request = URLRequest(url:url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        let postString = "username=\(username!)&password=\(password!)&firstname=\(firstname!)&lastname=\(lastname!)&email=\(email!)"
        request.httpBody = postString.data(using: .utf8)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) {
            
            (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
            }
            
            if let data = data {
                
                let responseMessage = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
                let status = (responseMessage["status"]) as! String
                if status == "success" {
                    print ("success")
                }
            }
            
            
        }
        
        task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
