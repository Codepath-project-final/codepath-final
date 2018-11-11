//
//  DescriptionViewController.swift
//  Parq
//
//  Created by Jangey Lu on 10/11/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var bookNowButton: UIButton!
    @IBOutlet weak var photoTableView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    

    func tableView(_ photoTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return photo.count
        return 10
    }
    
    func tableView(_ photoTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = photoTableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        return cell
    }
    
   

}
