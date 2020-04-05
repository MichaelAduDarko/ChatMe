//
//  ConversationViewModel.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 4/5/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import Foundation


struct ConversationViewModel {
    
    private let conversation: Conversation
    
    var profilImageUrl: URL?{
        return URL(string: conversation.user.profileImageUrl)
    }
    
    var timestamp: String {
        let date = conversation.message.timestamp.dateValue()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
        
    }
    
    init(conversation: Conversation) {
        self.conversation = conversation
    }
}
