//
//  DescriptionViewController.swift
//  Parq
//
//  Created by Jangey Lu on 10/11/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController{

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bookNowButton: UIButton!
    @IBOutlet weak var photoTableView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var post : [String: Any]? = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let post = post {

            descriptionLabel.text = post["post_description"] as! String?
            locationLabel.text = post["location"] as! String?
            priceLabel.text = "$\(post["post_price"] as! String)"
            
            let imageUrl = post["imageURL"] as! String
            let url = URL(string: imageUrl)!
            photoTableView.af_setImage(withURL: url)

        }
    }
    
    @IBAction func bookPress(_ sender: Any) {
        if LoginViewController.isLoggedIn {
            performSegue(withIdentifier: "confirmButton", sender: self)
        } else {
            performSegue(withIdentifier: "registerPage", sender: self)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        // prepare go to confirm view
        if (segue.identifier == "confirmButton") {
                let post = self.post
                let confirmViewController = segue.destination as! ConfirmViewController
                confirmViewController.post = post
        }
    }
    
}
