//
//  ProfileViewModel.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 4/12/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import Foundation

enum ProfileViewModel: Int, CaseIterable {
    case accountInfo
    case settings
    
    var description: String {
        switch self {
        case .accountInfo : return "Account Info"
        case .settings : return "Settings"
        }
    }
    
    var iconImageName: String {
        switch self {
        case .accountInfo : return "person.circle"
        case .settings : return "gear"
        }
    }
    
}
