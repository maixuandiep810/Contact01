//
//  UIInformation.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/5/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import Foundation
import UIKit

class AddView_UI_Information {
    
    /*
     Get Contact Object From UI Contacts View
    */
    static func getContactFromAddView(addView: AddViewController) -> Contact {
        let contact: Contact = ContactManager.shared.initContactObject()
        contact.name = addView.nameTextField.text
        contact.email = addView.emailTextField.text
        contact.mobile = addView.mobileTextField.text
        contact.address = addView.addressTextField.text
        return contact
    }
    /*
     Get Contact Object From UI Contacts View
     */
    static func check_UI_Information(addView: AddViewController) -> Bool {
        if addView.nameTextField.text == "" {
            let alert = UIAlertController(title: "Warning", message: "Name is null", preferredStyle: .alert)
            let alertActionOk = UIAlertAction(title: "OK", style: .default) { (act) in
                print("OK")
            }
            alert.addAction(alertActionOk)
            addView.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
}
