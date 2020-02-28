//
//  Event.swift
//  mdb-socials
//
//  Created by James Jung on 2/27/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class Event {
    var name: String
    
    var EventCreator: String
    var picture: UIImage
    var rsvpNum: Int
    var date: Date
    var description: String
    var location: String
    
    init(_ name: String, _ EventCreator: String, _ picture: UIImage, _ rsvpNum: Int, _ date: Date, _ description: String, _ location: String) {
        self.name = name
        self.EventCreator = EventCreator
        self.picture = picture
        self.rsvpNum = rsvpNum
        self.date = date
        self.description = description
        self.location = location
    }
    
    
}
