//
//  ProfileFooter.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 4/12/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

protocol ProfileFooterDelegate: class {
    func handleLogout()
}
class ProfileFooter: UIView {
    
    //MARK: - Properties
    
    weak var delegate: ProfileFooterDelegate?
    
    private lazy var logoutButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(logoutButton)
        logoutButton.anchor(left: leftAnchor,
                            right: rightAnchor,
                            paddingLeft: 32,
                            paddingRight: 32)
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.centerY(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Selector
    
    @objc func handleLogout(){
        delegate?.handleLogout()
    }
}
