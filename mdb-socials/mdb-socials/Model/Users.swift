//
//  Users.swift
//  mdb-socials
//
//  Created by James Jung on 2/27/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation

class Users {
    var id: String
    var userName: String
    var email: String
    var rsvpLst: [String]
    
    init(_ id: String, _ userName: String, _ email: String, _ rsvpLst: [String]) {
        self.id = id
        self.userName = userName
        self.email = email
        self.rsvpLst = rsvpLst
    }
    
    
}
