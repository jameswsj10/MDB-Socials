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
    var events = EventManager.getEvents()
    var currIndexPath: IndexPath!
    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func viewWillAppear(_ animated: Bool) {
        eventsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let details = segue.destination as? SocialDetailVC, segue.identifier == "goToDetails" {
            details.currEvent = events[currIndexPath.row]
        }
    }
    
}
