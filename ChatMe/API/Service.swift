//
//  Service.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/29/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

struct Service {
    static func fetchUsers(completion: @escaping([User])-> Void){
        var users = [User]()
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                users.append(user)
                completion(users)
            })
        }
    }
}

