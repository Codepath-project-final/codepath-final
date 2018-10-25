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
    func registerUser (_ LastName: String, _ FirstName: String, _ username: String, _ password: String, _ email: String!) -> Bool {
        print("got here");
        
        
        // URL for making POST request to the heroku server
        
        let url = URL(string: "https://parkistan.herokuapp.com/register")!
        
        var request = URLRequest(url:url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        
        // define HTTP POST method
        request.httpMethod = "POST"
        
        // send data as httpBody encoded in utf format
        
        
        request.httpBody = "username=\(usernameTextField)&password=\(passwordTextField)&email=\(emailTextField)&FirstName=\(firstNameTextField)&LastName=\(lastNameTextField)".data(using: .utf8)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) {
            
            (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                
            }
                
            else if let data = data {
                
                let responseMessage = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                
                
            }
        }
        return false;
    }
    

    
    @IBAction func register(_ sender: Any) {
        registerUser(lastNameTextField.text!, firstNameTextField.text!, usernameTextField.text!, passwordTextField.text!, emailTextField.text!)
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
