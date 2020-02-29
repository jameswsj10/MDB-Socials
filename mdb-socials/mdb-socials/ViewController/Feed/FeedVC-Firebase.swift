//
//  FeedVC-Firebase.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

extension FeedVC {
    
//    func getSocials() {
//        let EventNode = Database.database().reference().child("Events")
//        EventNode.observeSingleEvent(of: .value, with: { (snapshot) in
//            let imagesNode = Storage.storage().reference().child("images")
//
//            let socialDict = snapshot.value as? [String:Any] ?? [:]
//            var allSocials: [Social] = []
//
//            for (key, value) in socialDict {
//                let currentSocial = Social(socialId: key, social: value as! [String : Any])
//                let currentSocialImage = imagesNode.child(key)
//                currentSocialImage.getData(maxSize: 100 * 1024 * 1024) { (data, error) in
//                    guard error == nil else {
//                        return
//                    }
//                    guard data != nil else {
//                        return
//                    }
//                    currentSocial.socialImage = UIImage(data: data!)
//                }
//                allSocials.append(currentSocial)
//                self.socialsTableView.reloadData()
//            }
//            self.socials = allSocials.sorted(by: { $0.socialDate > $1.socialDate })
//            self.socialsTableView.reloadData()
//        })
//    }
}
