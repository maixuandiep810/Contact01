//
//  ContactManager.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/5/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ContactManager {
    
    //---
    // MARK: Properties
    //---
    static let shared = ContactManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var context = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
    
    /*
     * Create Contact object : NSManagedObject
     */
    func initContactObject() -> Contact {
        return Contact(context: context)
    }
    
    /*
     * READ list of contact from Sqlite using coreData
     */
    func fetchData() -> [Contact] {
        var myContacts :[Contact] = []
        let fetchRequest = NSFetchRequest<Contact>(entityName: "Contact")
        context = appDelegate.persistentContainer.viewContext
        do {
            myContacts = try context.fetch(fetchRequest)
            return myContacts
        }
        catch {
            print (error)
        }
        return []
    }

    /*
     * ADD a Contact object to Sqlite using coreData
     */
    func saveData(contact: Contact) -> Bool {
        context = appDelegate.persistentContainer.viewContext
        let newContact = Contact(context: context)
        newContact.copyValue(contact: contact)
        do {
            try context.save()
            return true
        }
        catch {
            print (error)
        }
        return false
    }
    
    /*
     * DELETE Contact object from Sqlite using coreData
     */
    func deleteData(name: String) {
        
        let deleteFetchRequest = NSFetchRequest<Contact>(entityName: "Contact")
        deleteFetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let contact = (
                try context.fetch(deleteFetchRequest).first)!
            context.delete(contact)
            try context.save()            
        } catch  {
            print(error)
        }
        
    }
}
