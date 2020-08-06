//
//  DetailViewController.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/5/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import UIKit

protocol DetailDataSource: class {
    func getContact() -> Contact
}

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //---
    // MARK: Properties
    //---
    @IBOutlet weak var tableView: UITableView!
    weak var datasource : DetailDataSource?
    var contact: Contact = ContactManager.shared.initContactObject()
    
    //---
    // MARK: Life Cycle Functions
    //---
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(goToEditView))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let datasource = datasource {
            contact = datasource.getContact()
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //---
    // MARK: UITableViewDataSource
    //---
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath.item
        var identifier : String
        var cell : DetailTableViewCell = DetailTableViewCell()
        switch index {
        case 0:
            identifier = TableViewCellIdString.NameCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DetailTableViewCell
            cell.content.text = contact.name
        case 1:
            identifier = TableViewCellIdString.MobileCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DetailTableViewCell
            cell.content.text = contact.mobile
        case 2:
            identifier = TableViewCellIdString.EmailCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DetailTableViewCell
            cell.content.text = contact.email
        case 3:
            identifier = TableViewCellIdString.AddressCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DetailTableViewCell
            cell.content.text = contact.address
        default:
            print("")
        }

        return cell
    }

    
    //---
    // MARK: Actions
    //---
    @objc func goToEditView() {
    }

}
