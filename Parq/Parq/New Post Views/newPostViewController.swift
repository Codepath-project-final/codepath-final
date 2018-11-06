//
//  newPostViewController.swift
//  Parq
//
//  Created by Jangey Lu on 11/5/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class newPostViewController: UIViewController {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescripionLabel: UITextField!
    @IBOutlet weak var postLocationLabel: UITextField!
    @IBOutlet weak var postPriceLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func postImageButton(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func shareButtonPress(_ sender: Any) {
    }
    
    
    @IBAction func cancelButtonPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
