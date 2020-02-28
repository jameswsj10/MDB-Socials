//
//  FeedVC-TableView.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return socials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventCell
        event.eventCreator.text = socials[indexPath.row].EventCreator
        event.eventImg.image = socials[indexPath.row].picture
        event.eventTitle.text = socials[indexPath.row].name
        event.RSVPCount.text = "\(socials[indexPath.row].rsvpEmailLst.count)"
        return event
    }
    
    
}
