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
        // set UI when contact is available
        didSet {
            nameLabel.text = contact.name
            mobileLabel.text = contact.mobile
        }
    }
    
    //---
    // MARK: default functions
    //---
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
