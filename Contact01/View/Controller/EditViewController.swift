//
//  EditViewController.swift
//  Contact01
//
//  Created by Diep (Rocky) X.MAI on 8/4/20.
//  Copyright © 2020 Diep (Rocky) X.MAI. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    //---
    // MARK: Properties
    //---

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
        print(1)
    }
}
