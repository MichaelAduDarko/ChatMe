//
//  NewMessageController.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/28/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class NewMessageController: UITableViewController {
    
    //MARK:- Properties
    
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK:- Helpers
    
    func configureUI() {
        view.backgroundColor = .systemRed
    }
}
