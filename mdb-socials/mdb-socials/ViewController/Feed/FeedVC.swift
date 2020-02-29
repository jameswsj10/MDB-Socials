//
//  FeedVC.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class FeedVC: UIViewController {
    var socials = EventManager.eventLst
    var currIndexPath: Int = 0
    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createNewEvent(_ sender: Any) {
        performSegue(withIdentifier: "goToCreatePg", sender: self)
    }
    
}
