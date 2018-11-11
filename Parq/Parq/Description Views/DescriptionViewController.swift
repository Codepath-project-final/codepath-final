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
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var bookNowButton: UIButton!
    @IBOutlet weak var photoTableView: UIImageView!
    
    var post : [String: Any]? = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let post = post {

            descriptionLabel.text = post["post_description"] as! String?
            
            let imageUrl = post["imageURL"] as! String
            let url = URL(string: imageUrl)!
            photoTableView.af_setImage(withURL: url)
        }
    }
    
   

}
