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

protocol ProfileControllerDelegate: class {
    func handleLogout()
}
class ProfileController: UITableViewController {
    
    //MARK:- Properties
    
    private var user: User? {
        didSet { headerView.user = user }
    }
    
    weak var delegate: ProfileControllerDelegate?
    
    private lazy var headerView = ProfileHeader(frame: .init(x: 0,
                                                             y: 0,
                                                             width: view.frame.width,
                                                             height: 380))
    private let footerView = ProfileFooter()
    
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
        tableView.register(ProfileCell.self, forCellReuseIdentifier: resuseIdentifier)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = 64
        tableView.backgroundColor = .systemGroupedBackground
        
        footerView.delegate = self
        footerView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 100)
        tableView.tableFooterView = footerView
        
        
    }
}

//MARK:- UITableViewDataSource

extension ProfileController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileViewModel.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resuseIdentifier , for: indexPath) as! ProfileCell
        
        let viewModel = ProfileViewModel(rawValue: indexPath.row)
        cell.viewModel = viewModel
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}


//MARK:- UITableViewDelegate

extension ProfileController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = ProfileViewModel(rawValue: indexPath.row) else { return }
        print("DEBUG: Handle action for \(viewModel.description)")
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

//MARK:- ProfileHeaderDelegate

extension ProfileController: ProfileHeaderDelegate {
    func dissmissController() {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileController: ProfileFooterDelegate {
    func handleLogout() {
        
        let alert = UIAlertController(title: nil,
                                      message: "Are you sure you want to logout?",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            self.dismiss(animated: true) {
                self.delegate?.handleLogout()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
