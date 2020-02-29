//
//  Event.swift
//  mdb-socials
//
//  Created by James Jung on 2/27/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class Event { // look into equitable / codable
    var name: String
    var id: String
    var EventCreator: String
    var picture: UIImage
    var rsvpIDLst: [String]
    var date: Date
    var description: String
    var location: String
    
    init(_ name: String, _ id: String, _ EventCreator: String, _ picture: UIImage, _ rsvpIDLst: [String], _ date: Date, _ description: String, _ location: String) {
        self.name = name
        self.id = id
        self.EventCreator = EventCreator
        self.picture = picture
        self.rsvpIDLst = rsvpIDLst
        self.date = date
        self.description = description
        self.location = location
    }
    
    
}
