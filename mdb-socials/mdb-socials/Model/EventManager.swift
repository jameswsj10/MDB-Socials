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
    
//    static func getEvents() -> [Event] {
//        let EventNode = Database.database().reference().child("Events")
//        var allEvents: [Event] = []
//        EventNode.observeSingleEvent(of: .value, with: { (snapshot) in
//            //let imagesNode = Storage.storage().reference().child("Images")
//            let EventDict = snapshot.value as? [String: [String: Any]] ?? [:]
//            for (key, val) in EventDict {
//                print("keys and values: \(key) \(val)")
//                let formatter = DateFormatter()
//                formatter.dateFormat = "yyyy/MM/dd HH:mm"
//                let eventDate = formatter.date(from: val["date"] as! String)
//
//                let currEvent = Event(val["name"] as! String, key, val["creator"] as! String, UIImage(named: "Logo")!, val["rsvpIDLst"] as! [String], eventDate!, val["description"] as! String, val["location"] as! String)
//                allEvents.append(currEvent)
//            }
//        })
//        return allEvents.sorted(by: { $0.date > $1.date })
//    }
}
