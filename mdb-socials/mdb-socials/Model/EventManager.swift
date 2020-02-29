//
//  EventManager.swift
//  mdb-socials
//
//  Created by James Jung on 2/27/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class EventManager {
    static var eventLst: [Event] = []
    
    func createNewEvent() {
        
    }
    
    func getEvents() -> [Event] {
        let EventNode = Database.database().reference().child("Events")
        EventNode.observeSingleEvent(of: .value, with: { (snapshot) in
            let imagesNode = Storage.storage().reference().child("Images")
            var allEvents: [Event] = []
        })
        
        self.eventLst = allEvents.sorted(by: { $0.date > $1.date })
        return EventManager.eventLst
    }
}
