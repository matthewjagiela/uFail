//
//  MessagesTableViewCell.swift
//  uFail
//
//  Created by Matthew Jagiela on 2/5/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    @IBOutlet var messageName: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
