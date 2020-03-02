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
        
        let db = Database.database().reference()
        let eventsNode = db.child("Events")
        let newEventsId = eventsNode.childByAutoId().key
        let user = Auth.auth().currentUser
       
      
        let imageRef = Storage.storage().reference().child("images").child(newEventsId!)
        let imageData = image.jpegData(compressionQuality: 0.1)
        
        imageRef.putData(imageData!, metadata: nil) { (metadata, err) in
        //Add to Realtime Database
            
            let eventNode = eventsNode.child(newEventsId!)
            let usersNode = db.child("Users")
            
            
            usersNode.child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
           //let userInfo = snapshot.value as? [String:Any] ?? [:]
                //let rsvpArray : [String]
                //rsvpArray = []
                
                imageRef.downloadURL(completion: { (url, error) in
                    
                    let post = ["creator": creator, "date": date, "description": description,
                                "location": location, "name": eventName, "image": url?.absoluteString]

                    eventNode.updateChildValues(post)
                    let rsvpNode = eventNode.child("rsvpIDLst");
                    rsvpNode.updateChildValues(["null": "null"])
                    
                })
        })
    
        }
    
        return
    }
    
    func getEvent() {
        
    }
}
