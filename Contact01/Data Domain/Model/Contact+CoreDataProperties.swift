//
//  Contact+CoreDataProperties.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/6/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var id: Int32
    @NSManaged public var mobile: String?
    @NSManaged public var name: String?

}
