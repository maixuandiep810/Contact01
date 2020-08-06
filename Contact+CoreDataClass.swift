//
//  Contact+CoreDataClass.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/5/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Contact)
public class Contact: NSManagedObject {
    func copyValue(contact: Contact) {
        name = contact.name
        mobile = contact.mobile
        email = contact.email
        address = contact.email
    }
}
