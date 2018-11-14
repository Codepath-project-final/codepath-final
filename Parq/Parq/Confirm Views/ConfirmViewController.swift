//
//  ConfirmViewController.swift
//  Parq
//
//  Created by Jangey Lu on 10/12/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var confirmTextView: UITextView!
    
    var post : [String: Any]? = nil
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let post = post {
            
            descriptionLabel.text = post["post_description"] as! String?
            locationLabel.text = post["location"] as! String?
            phoneNumberLabel.text = post["phone"] as! String?
            
            
        }
    }
    
    @IBAction func tapConfirm(_ sender: Any) {
        performSegue(withIdentifier: "BackToMainPage", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
