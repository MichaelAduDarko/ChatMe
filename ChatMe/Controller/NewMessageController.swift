//
//  NewMessageController.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/28/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "UserCell"

class NewMessageController: UITableViewController {
    
    //MARK:- Properties
    private lazy var actionButton: UIButton = {
           let button = UIButton(type: .system)
           button.backgroundColor = .systemPink
           button.setTitle("Cancel", for: .normal)
           button.titleLabel?.textAlignment = .center
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
           button.setTitleColor(.white, for: .normal)
           
           button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
           button.layer.cornerRadius = 32 / 2
           button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
           return button
       }()
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK:- selector
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
        }
    //MARK:- Helpers
    
    func configureUI() {
        configureNavigationBar(withTitle: "Messages", prefersLargeTitles: false)

//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
}

//MARK:- UITableViewDataSource

extension NewMessageController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        return cell
        
    }
}
