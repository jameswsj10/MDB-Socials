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
        return socials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventCell
        let event = socials[indexPath.row]
        cell.eventCreator.text = event.EventCreator
        cell.eventImg.image = event.picture
        cell.eventTitle.text = event.name
        cell.RSVPCount.text = "\(event.rsvpIDLst.count)"
        return cell
    }
    
    func tableView(_ collectionView: UICollectionView, didSelectRowAt indexPath: IndexPath) {
        self.currIndexPath = indexPath.row
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    
}
