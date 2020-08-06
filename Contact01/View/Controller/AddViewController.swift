//
//  AddViewController.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/5/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import UIKit

protocol AddContactDelegate: class {
    func addContact(contact: Contact)
}

class AddViewController: UITableViewController {

    //---
    // MARK: Properties
    //---
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    var delegate: AddContactDelegate?
    
    
    //---
    // MARK: Life Cycle Functions
    //---
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let editButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleDone))
        self.navigationItem.rightBarButtonItem = editButton
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //---
    // MARK: Actions
    //---
    @objc func handleDone() {
        if AddView_UI_Information.check_UI_Information(addView: self) {
            var contact: Contact! = AddView_UI_Information.getContactFromAddView(addView: self)
            delegate?.addContact(contact: contact)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

}
