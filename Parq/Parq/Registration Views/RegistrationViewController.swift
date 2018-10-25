//
//  RegistrationViewController.swift
//  Parq
//
//  Created by Preston on 10/15/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit
import Parse

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
        let newUser = PFUser()
        
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground { (success: Bool
            , error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
