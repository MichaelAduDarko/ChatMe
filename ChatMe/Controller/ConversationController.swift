//
//  ConversationController.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/24/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class ConversationController: UIViewController {
    
    //MARK:- Properties
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK:- Selectors
    @objc func showProfile(){
        print("1234")
    }
    
    
    
    //MARK:-Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        let image = UIImage(systemName: "person.circle.fill")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain,
                                                           target: self, action: #selector(showProfile))
        
    }
    
    
}
