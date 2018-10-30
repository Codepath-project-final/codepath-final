//
//  LoginViewController.swift
//  Parq
//
//  Created by Preston on 10/15/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

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
    
    
    @IBAction func login(_ sender: Any) {
//        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?
//            , error: Error?) in
//            if user != nil {
//                print("Loged in Success!")
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            }
//        }
        
        loginUser(usernameTextField.text, passwordTextField.text)
        
    }
    
    func loginUser(_ username: String!, _ password: String!) {
        
        let url = URL(string: "https://parkistan.herokuapp.com/login")!
        
        var request = URLRequest(url:url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        let postString = "username=\(username!)&password=\(password!)"
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
