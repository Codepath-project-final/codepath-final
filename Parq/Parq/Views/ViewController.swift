//
//  ViewController.swift
//  Parq
//
//  Created by Preston on 10/8/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var registeredSideView: UIView!
    @IBOutlet weak var unregisterSideView: UIView!
    @IBOutlet weak var registeredSideViewLeadingEdge: NSLayoutConstraint!
    @IBOutlet weak var unregisterSideViewLeadingEdge: NSLayoutConstraint!
    
    var registeredSideViewDisplay = false
    var unregisterSlideViewDisplay = false
    
    var posts: [[String: Any]] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.loginUser("ramesh", "khan")
        //print("here")
        self.getData()
        tableView.rowHeight = 160
        tableView.dataSource = self
        tableView.delegate = self
        
        //sideView Shadow
        registeredSideView.layer.shadowOpacity = 1
        registeredSideView.layer.shadowRadius = 30
        unregisterSideView.layer.shadowOpacity = 1
        unregisterSideView.layer.shadowRadius = 30
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        getData()
    }
    
    // show the sideView when press the Menu Icon
    @IBAction func sideViewPress(_ sender: Any) {
        // if login users press
        //if user == login {
        print(LoginViewController.isLoggedIn)
        if LoginViewController.isLoggedIn{
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
        }
        
        // if unlogin users press
        else {
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
        }
    }
    
    @IBAction func newPostPress(_ sender: Any) {
        if (LoginViewController.isLoggedIn) {
            performSegue(withIdentifier: "newPost", sender: self)
        } else {
            performSegue(withIdentifier: "registrationView", sender: self)
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return posts.count
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        let post = posts[indexPath.row]
        
        if let description = post["post_description"] as? NSNull {
            // don't create the object, 'cuz we can't have a Repository without an id
            cell.descriptionLabel.text! = "null"

        }

        else {
            
             cell.descriptionLabel.text! = post["post_description"] as! String
             cell.priceLabel.text! = "$\(post["post_price"] as! String)"
        }
        
        
        if let location = post["location"] as? NSNull {
            
            cell.locationLabel.text! = "null"
        }
        else {
            
            cell.locationLabel.text! = post["location"] as! String
        }
        
        let imageUrl = post["imageURL"] as! String
        let url = URL(string: imageUrl)!
        cell.photoImage.af_setImage(withURL: url)
        
        return cell
    }

    @IBAction func accountButtonPress(_ sender: Any) {
    }
    
    
    @IBAction func logoutButtonPress(_ sender: Any) {
        LoginViewController.isLoggedIn = false;
        performSegue(withIdentifier: "LogOut", sender: self)
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
    
    func getData() {
        
        let url = URL(string: "https://parkistan.herokuapp.com/posts")!
        
        let request = URLRequest(url:url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) {
            
            (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
            }
                
            else if let data = data {
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                
                self.posts = dataDictionary
                print(self.posts)
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
        
        task.resume()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // prepare go to description view
        if (segue.identifier == "detailView") {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell){
                let post = posts[indexPath.row]
                let detailViewController = segue.destination as! DescriptionViewController
                detailViewController.post = post
            }
        }
    }
    
}

