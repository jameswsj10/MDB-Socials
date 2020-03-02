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
import FirebaseStorage

class EventManager {
    static var eventLst: [Event] = []
    
    func createNewEvent(creator: String, date: String, description: String, image: UIImage, location: String, eventName: String) {
        
        //Add Image to Storage
        
        print("Create Event is Running")
        
        let db = Database.database().reference()
        let eventsNode = db.child("Events")
        let newEventsId = eventsNode.childByAutoId().key
        let user = Auth.auth().currentUser
       
      
        let imageRef = Storage.storage().reference().child("images").child(newEventsId!)
        var imageData = image.jpegData(compressionQuality: 0.1)
        
        print("NewSocialVC: ", imageData)
        imageRef.putData(imageData!, metadata: nil) { (metadata, err) in
        //Add to Realtime Database
            let eventNode = eventsNode.child(newEventsId!)
            let usersNode = db.child("Users")
            usersNode.child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
           //let userInfo = snapshot.value as? [String:Any] ?? [:]
                let rsvpArray : [String]
                rsvpArray = []
                let post = ["creator": creator, "date": date, "description": description,
                            "location": location, "eventName": eventName, "rsvpIDLst": rsvpArray] as [String : Any]
                
                eventNode.updateChildValues(post)
        })
    
        }
    
        return
    }
    
    func getEvent() {
        
    }
}
