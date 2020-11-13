//
//  NotExpandTableViewCell.swift
//  sonnt.training2
//
//  Created by Nero on 11/13/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import UIKit

class NotExpandTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
