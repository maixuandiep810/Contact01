//
//  DetailTableViewCell.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/5/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import UIKit

class DetailTableViewCell : UITableViewCell {
    //---
    // MARK: Properties
    //---
    @IBOutlet weak var content :UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
