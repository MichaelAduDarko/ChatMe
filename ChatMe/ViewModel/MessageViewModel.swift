//
//  MessageViewModel.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 4/1/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

struct MessagViewModel {
    
    private let message: Message
    
    var messageBackgroundColor: UIColor {
        return message.isFromCurrentUser ? #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    var messagetextColor: UIColor {
        return message.isFromCurrentUser ? .white : .white
    }
    
    var righAnchorActive: Bool {
        return message.isFromCurrentUser
    }
    
    var leftAnchorActive: Bool {
        return !message.isFromCurrentUser
    }
    
    var shouldHideProfileImage: Bool {
        return message.isFromCurrentUser
    }
    
    var profileImageUrl: URL? {
        guard let user = message.user else { return nil}
        return URL(string: user.profileImageUrl)
    }
    
    
    
    init(message: Message) {
        self.message = message
    }
}
