//
//  UIInformation.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/5/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import Foundation

class UIInformation {
    static func getContactFromAddView(addView: AddViewController) -> Contact {
        var contact: Contact = ContactManager.shared.initContactObject()
        contact.name = addView.nameTextField.text as! String
        contact.email = addView.emailTextField.text as! String
        contact.mobile = addView.mobileTextField.text as! String
        contact.address = addView.addressTextField.text as! String
        return contact
    }
}
