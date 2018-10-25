//
//  LoginViewController.swift
//  Parq
//
//  Created by Preston on 10/15/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self as? UITextFieldDelegate
        passwordTextField.delegate = self as? UITextFieldDelegate
        
        usernameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginUser (_ username: String, _ password: String) -> Bool {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if(username.isEmpty || password.isEmpty) {
            
            //self.errorLabel.text = "*Please provide usernname and pasword"
        }
        
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?
            , error: Error?) in
            if user != nil {
                print("Loged in Success!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        return false
    }
    
    @IBAction func login(_ sender: Any) {
        loginUser(usernameTextField.text!, passwordTextField.text!)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
