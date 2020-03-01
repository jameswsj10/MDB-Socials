//
//  FeedVC.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class FeedVC: UIViewController {
    var events = EventManager.eventLst
    var currIndexPath: IndexPath!
    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEvents()
        print("this is the events list: \(events)")
    }

    @IBAction func createNewEvent(_ sender: Any) {
        performSegue(withIdentifier: "goToCreatePg", sender: self)
    }
    
    @IBAction func PressLogOut(_ sender: Any) {
        logOut()
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func getEvents() {
        let EventNode = Database.database().reference().child("Events")
        EventNode.observeSingleEvent(of: .value, with: { (snapshot) in
            //let imagesNode = Storage.storage().reference().child("Images")
            var allEvents: [Event] = []
            let EventDict = snapshot.value as? [String: [String: Any]] ?? [:]
            for (key, val) in EventDict {
                print("keys and values: \(key) \(val)")
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let eventDate = formatter.date(from: val["date"] as! String)
                
                let currEvent = Event(val["name"] as! String, key, val["creator"] as! String, UIImage(named: "Logo")!, val["rsvpIDLst"] as! [String], eventDate!, val["description"] as! String, val["location"] as! String)
                allEvents.append(currEvent)
            }
            self.events = allEvents.sorted(by: { $0.date > $1.date })
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        eventsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let details = segue.destination as? SocialDetailVC, segue.identifier == "goToDetails" {
            details.currEvent = events[currIndexPath.row]
        }
    }
    
}
