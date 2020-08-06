//
//  ContactTableViewCell.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/4/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    //---
    // MARK: Properties
    //---
    @IBOutlet weak var nameLabel :UILabel!
    @IBOutlet weak var mobileLabel :UILabel!
    
    var contact: Contact = ContactManager.shared.initContactObject() {
        didSet {
            nameLabel.text = contact.name
            mobileLabel.text = contact.mobile
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
