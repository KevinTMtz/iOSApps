//
//  MessageCell.swift
//  Messenger
//
//  Created by Kevin Torres on 23/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rightImagevIEW: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
