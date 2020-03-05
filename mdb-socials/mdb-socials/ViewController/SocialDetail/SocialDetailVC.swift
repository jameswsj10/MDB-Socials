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
    var rsvpd = false
    let currUserID = Auth.auth().currentUser!.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEventDetails()
    }
    
    func updateEventDetails() {
        EventImg.image = currEvent.picture
        EventName.text = currEvent.name
        EventCreator.text = "Event By \(currEvent.EventCreator)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        EventDate.text = formatter.string(from: currEvent.date)
        
        EventDescription.text = currEvent.description
        //InterestCount.text = "People Interested: \(currEvent.rsvpIDLst.count)"
        
        if currEvent.rsvpIDLst.contains(self.currUserID) {
            //self.rsvpButton.setTitle("Un-RSVP", for: .disabled)
            rsvpd = true
        } else {
            //self.rsvpButton.setTitle("RSVP Now!", for: .disabled)
            rsvpd = false
        }
        updateRSVP()
    }
    
    @IBAction func rsvp_unrsvp(_ sender: Any) {
        let EventNode = Database.database().reference().child("Events").child(currEvent.id)
        EventNode.observeSingleEvent(of: .value, with: { (snapshot) in
            if !self.currEvent.rsvpIDLst.contains(self.currUserID) {
                self.currEvent.rsvpIDLst.append(self.currUserID)
                self.rsvpd = true
                self.updateRSVP()
                self.updateDB()
            } else {
                self.currEvent.rsvpIDLst = self.currEvent.rsvpIDLst.filter{$0 != self.currUserID} //removes curruserID
                self.rsvpd = false
                self.updateRSVP()
                self.updateDB()
            }
        })
    }
    
    func updateRSVP() {
        DispatchQueue.main.async {
            self.InterestCount.text = "People Interested: \(self.currEvent.rsvpIDLst.count)"
            if (self.rsvpd == true) {
                self.rsvpButton.setTitle("Un-RSVP", for: .normal)
                // change rsvp count on database so Feed page has updated rsvp value
            } else {
                self.rsvpButton.setTitle("RSVP Now!", for: .normal)
            }
        }
    }
    
    func updateDB() {
        //updates Database of RSVP count for this specific event
    }

}
