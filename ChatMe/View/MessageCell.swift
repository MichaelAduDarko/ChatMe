//
//  MessageCell.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 4/1/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class MessageCell: UICollectionViewCell {
    
    //MARK:- Properties
    private let profileImageview: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    private let textview: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.font = .systemFont(ofSize: 16)
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.textColor = .white
        tv.text = "Hey wassup Mike"
        return tv
    }()
    
    private let bubbleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    //MARK:- Lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageview)
        profileImageview.anchor(left: leftAnchor, bottom: bottomAnchor, paddingTop: 8, paddingBottom: -4)
        profileImageview.setDimensions(height: 32, width: 32)
        profileImageview.layer.cornerRadius = 32 / 2
        
        addSubview(bubbleContainer)
        bubbleContainer.layer.cornerRadius = 12
        bubbleContainer.anchor(top: topAnchor, left: profileImageview.rightAnchor, paddingLeft: 12)
        bubbleContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        addSubview(textview)
        textview.anchor(top: bubbleContainer.topAnchor,
                        left: bubbleContainer.leftAnchor,
                        bottom: bubbleContainer.bottomAnchor,
                        right: bubbleContainer.rightAnchor,
                        paddingTop: 4,
                        paddingLeft: 12,
                        paddingBottom: 4,
                        paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
