//
//  SocialDetailVC.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SocialDetailVC: UIViewController {

    var currEvent: Event!
    @IBOutlet weak var EventImg: UIImageView!
    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var EventCreator: UILabel!
    @IBOutlet weak var EventDate: UILabel!
    @IBOutlet weak var EventDescription: UILabel!
    @IBOutlet weak var InterestCount: UILabel!
    @IBOutlet weak var rsvpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEventDetails()
    }
    
    func updateEventDetails() {
        EventImg.image = currEvent.picture
        EventName.text = currEvent.name
        EventCreator.text = currEvent.EventCreator
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        EventDate.text = "Date: " + formatter.string(from: currEvent.date)
        
        EventDescription.text = currEvent.description
        InterestCount.text = "People Interested: \(currEvent.rsvpIDLst.count)"
        
        if currEvent.rsvpIDLst.contains(Auth.auth().currentUser!.uid) {
            self.rsvpButton.setTitle("Un-RSVP", for: .disabled)
        } else {
            self.rsvpButton.setTitle("RSVP Now!", for: .disabled)
        }
    }
    
    func retrieveData() {
        
    }
    
    @IBAction func rsvp_unrsvp(_ sender: Any) {
        let EventNode = Database.database().reference().child("Events").child(currEvent.id)
        EventNode.observeSingleEvent(of: .value, with: { (snapshot) in
            let currUserID = Auth.auth().currentUser!.uid
            if !self.currEvent.rsvpIDLst.contains(currUserID) {
                self.currEvent.rsvpIDLst.append(currUserID)
            } else {
                self.currEvent.rsvpIDLst = self.currEvent.rsvpIDLst.filter{$0 != currUserID}
            }
        })
    }
    

}
