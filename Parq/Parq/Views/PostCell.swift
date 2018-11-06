//
//  PostCell.swift
//  Parq
//
//  Created by Preston on 10/10/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
