//
//  AccountViewController.swift
//  Parq
//
//  Created by Jangey Lu on 10/15/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var newUsername: UITextField!
    @IBOutlet weak var newPhoneNumber: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButtonPress(_ sender: Any) {
        // save new info
        /*
         username = newUsername.text
         phone = newPhoneNumber.text
         if(newPassword.text == confirmPassword) {
            password = cnfirmPassword
         }
        */
        
        // back to main page.
        let MainPage = self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController")
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = MainPage
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    
    /*
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        return
    }
    */
}
