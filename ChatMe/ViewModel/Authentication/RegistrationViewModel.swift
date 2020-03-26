//
//  RegistrationViewModel.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/25/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

struct RegistrationViewModel : AuthenticationProtocol {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsValid: Bool{
        return email?.isEmpty  == false
            && password?.isEmpty  == false
            && fullname?.isEmpty == false
            && username?.isEmpty == false
    }
}
