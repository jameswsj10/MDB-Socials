//
//  FeedVC-TableView.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

extension FeedVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventCell
        let event = events[indexPath.row]
        cell.eventCreator.text = event.EventCreator
        cell.eventImg.image = event.picture
        cell.eventTitle.text = event.name
        cell.RSVPCount.text = "\(event.rsvpIDLst.count)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currIndexPath = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    
}
