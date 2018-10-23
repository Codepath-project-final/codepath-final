//
//  ViewController.swift
//  Parq
//
//  Created by Preston on 10/8/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var registeredSideView: UIView!
    @IBOutlet weak var unregisterSideView: UIView!
    
    @IBOutlet weak var registeredSideViewLeadingEdge: NSLayoutConstraint!
    @IBOutlet weak var unregisterSideViewLeadingEdge: NSLayoutConstraint!
    
    var registeredSideViewDisplay = false
    var unregisterSlideViewDisplay = false
    
    var posts: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 160
        tableView.dataSource = self
        tableView.delegate = self
        
        //sideView Shadow
        registeredSideView.layer.shadowOpacity = 1
        registeredSideView.layer.shadowRadius = 30
        unregisterSideView.layer.shadowOpacity = 1
        unregisterSideView.layer.shadowRadius = 30
    }
    
    // show the sideView when press the Menu Icon
    @IBAction func sideViewPress(_ sender: Any) {
        // if login users press
        //if user == login {
            if (registeredSideViewDisplay) {
                registeredSideViewLeadingEdge.constant = -240
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                })
            } else {
                registeredSideViewLeadingEdge.constant = 0
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                })
            }
            registeredSideViewDisplay = !registeredSideViewDisplay
        //}
        
        // if unlogin users press
        //else {
            if (unregisterSlideViewDisplay) {
                unregisterSideViewLeadingEdge.constant = -240
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                })
            } else {
                unregisterSideViewLeadingEdge.constant = 0
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                })
            }
            unregisterSlideViewDisplay = !unregisterSlideViewDisplay
        //}
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return posts.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
       
        cell.descriptionLabel.text! = "The fuck is this"
        cell.locationLabel.text! = "mars"
        return cell
    }

    @IBAction func accountButtonPress(_ sender: Any) {
    }
    
    
    @IBAction func logoutButtonPress(_ sender: Any) {
        //currentUser.logout
        performSegue(withIdentifier: "LogOut", sender: self)
    }
}

