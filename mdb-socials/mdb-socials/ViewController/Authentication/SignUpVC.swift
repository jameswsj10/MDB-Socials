//
//  SignUpVC.swift
//  mdb-socials
//
//  Created by James Jung on 2/27/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SignUpVC: UIViewController {
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    @IBAction func backArrowPressed(_ sender: Any) {
        //dismiss(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginRegisterPressed(_ sender: Any) {
        handleRegister()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RegisterButton.layer.cornerRadius = 3
    }
    //    func handleRegister() {
    //        guard let name = nameTxtField.text else {
    //            return
    //        }
    //        guard let username = usernameTxtField.text else {
    //            return
    //        }
    //        guard let email = emailTxtField.text else {
    //            return
    //        }
    //        guard let password = passwordTxtField.text else {
    //            return
    //        }
    //        // create user
    //        let auth = Auth.auth()
    //        auth.createUser(withEmail: email, password: password) { (user, error) in
    //            guard error == nil else {
    //                self.displayAlert(title: "Error", message: error.debugDescription)
    //                return
    //            }
    //            guard user != nil else {
    //                self.displayAlert(title: "Error", message: "No User")
    //                return
    //            }
    //
    //            // now adding in user to the database
    //            let db = Database.database().reference()
    //            let usersNode = db.child("Users")
    //            guard let newUserId = usersNode.childByAutoId().key else {
    //                print("problem creating new usersNode child")
    //                return
    //            }// creates a unique id that is not already stored in the db - created a node
    //            let userNode = usersNode.child(newUserId) // now we traverse into it
    //            /* set value vs. updatechildvalue:
    //             *  setvalue deletes everything and sets a new value
    //             *  update value updates specific fields
    //             */
    //            userNode.updateChildValues(["email": email, "name": name, "username": username])
    //            //self.performSegue(withIdentifier: "toMainFeed", sender: self) // make sure to have the segue
    //        }
    //    }
        
        func handleRegister() {
            let name = nameTxtField.text!
            let username = usernameTxtField.text!
            let email = emailTxtField.text!
            let password = passwordTxtField.text!
            let auth = Auth.auth()
            
            auth.createUser(withEmail: email, password: password) { (user, error) in
                guard error == nil else {
                    self.displayAlert(title: "Error", message: error.debugDescription)
                    return
                }
                guard user != nil else {
                    self.displayAlert(title: "Error", message: "No user")
                    return
                }
                
                
                let db = Database.database().reference()
                let usersNode = db.child("Users")
                let newUserId = usersNode.childByAutoId().key
                let userNode = usersNode.child(newUserId!)
                userNode.updateChildValues(["name": name, "email": email,
                                            "username": username])
                
                //self.performSegue(withIdentifier: "SignupVCtoNC", sender: self)
            }
        }
        
        override func viewWillAppear(_ animated: Bool) {
            navigationController?.navigationBar.isHidden = true
            RegisterButton.isUserInteractionEnabled = true
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            navigationController?.navigationBar.isHidden = false
        }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }

}
