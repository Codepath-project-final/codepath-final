//
//  MessageViewController.swift
//  Parq
//
//  Created by Jangey Lu on 10/12/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageTableView.rowHeight = 100
        messageTableView.dataSource = self
        messageTableView.delegate = self
    }
    

    func tableView(_ messageTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return message.count
        return 10
    }
    
    func tableView(_ messageTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messageTableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        
        return cell
    }

}
