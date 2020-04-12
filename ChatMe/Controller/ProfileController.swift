//
//  ProfileController.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 4/11/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

private let resuseIdentifier = "ProfileCell"
class ProfileController: UITableViewController {
    
    //MARK:- Properties
    
    private var user: User? {
        didSet { headerView.user = user }
    }
    private lazy var headerView = ProfileHeader(frame: .init(x: 0,
                                                             y: 0,
                                                             width: view.frame.width,
                                                             height: 380))
    
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurUI()
        fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    //MARK:- Selectors
    
    
    //MARK:- API
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Service.fetchUser(withUid: uid) { user in
            self.user = user
        }
    }
    
    //MARK:- Helpers
    
    
    func configurUI() {
        tableView.backgroundColor = .white
        
        tableView.tableHeaderView = headerView
        headerView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: resuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
    }
}

extension ProfileController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resuseIdentifier , for: indexPath)
        return cell
    }
}

extension ProfileController: ProfileHeaderDelegate {
    func dissmissController() {
        dismiss(animated: true, completion: nil)
    }
}
