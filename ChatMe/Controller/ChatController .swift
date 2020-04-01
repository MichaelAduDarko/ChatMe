//
//  ChatController .swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/31/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class ChatController: UICollectionViewController {
    
    //MARK:- Properties
    private let user: User
    
    private lazy var customInputView: CustomInputAccessoryView = {
        let iv = CustomInputAccessoryView(frame:  CGRect(x: 0,
                                                         y: 0,
                                                         width: view.frame.width,
                                                         height: 50))
        
        return iv
    }()
    
    //MARK: - LifeCycle
    init(user: User ) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override var inputAccessoryView: UIView? {
        get { return customInputView }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    //MARK:- Helpers
    
    func configureUI(){
        collectionView.backgroundColor = .white
        configureNavigationBar(withTitle: user.username, prefersLargeTitles: false)
    }
}
