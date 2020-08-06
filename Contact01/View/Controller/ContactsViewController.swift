//
//  ContactsViewController.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/4/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , AddContactDelegate, DetailDataSource{
    
    //---
    // MARK: Properties
    //---			
    @IBOutlet weak var contactsTableView: ContactsTableView!
    var contactList :[Contact] = []
    
    
    //---
    // MARK: Life Cycle Functions
    //---
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactList = ContactManager.shared.fetchData()
//        self.navigationItem.rightBarButtonItem?.action = #selector(addButton)
    }
    
    
    //---
    // MARK: UITableViewDataSource
    //---
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contactList[indexPath.row]
        let cell = self.contactsTableView.dequeueReusableCell(withIdentifier: TableViewCellIdString.ContactTableViewCellIdString, for: indexPath) as! ContactTableViewCell
        cell.contact = contact
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationItem.backBarButtonItem?.title = "Contacts"
        let next = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdString.DetailViewController) as! DetailViewController
        next.datasource = self
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let cell = self.contactsTableView.cellForRow(at: indexPath) as! ContactTableViewCell
        if editingStyle == .delete {
            ContactManager.shared.deleteData(name: cell.contact.name ?? "")
        }
        contactList = ContactManager.shared.fetchData()
        contactsTableView.reloadData()
    }
    
    
    
    //---
    // MARK: DetailDataSource
    //---
    func getContact() -> Contact {
        let indexPath = contactsTableView.indexPathForSelectedRow as! IndexPath
        let cell = self.contactsTableView.cellForRow(at: indexPath) as! ContactTableViewCell
        return cell.contact
    }
    
    //---
    // MARK: AddContactDelegate
    //---
    func addContact(contact: Contact) {
        ContactManager.shared.saveData(contact: contact)
        contactList = ContactManager.shared.fetchData()
        contactsTableView.reloadData()
    }
    
    //---
    // MARK: Actions
    //---
    @IBAction func addButton() {
        self.navigationItem.backBarButtonItem?.title = "Cancel"
        let next = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdString.AddViewController) as! AddViewController
        next.delegate = self
        self.navigationController?.pushViewController(next, animated: true)
    }
}


