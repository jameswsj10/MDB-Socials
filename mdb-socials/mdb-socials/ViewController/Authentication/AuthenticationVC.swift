//
//  Authentication.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import UIKit
import Firebase

class AuthenticationVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func tabLogInButton(_ sender: Any) {
        handleLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 3
    }
    
    func handleLogin() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) {(user, error) in
            guard error == nil || user != nil else {
                self.displayAlert(title: "Error", message: "Invalid Credentials")
                return
            }
            
            self.displayAlert(title: "Success", message: "Verification Complete")
            
            //self.performSegue(withIdentifier: "toMainFeed", sender: self)
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
 
    /*
    func handleRegister() {
        guard let name = nameTextField.text else {
            return
        }
        guard let number = phoneNumberTextField.text else {
            return
        }
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        // create user
        let auth = Auth.auth()
        auth.createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                self.displayAlert(title: "Error", message: "Create User yoasted")
                return
            }
            guard user != nil else {
                self.displayAlert(title: "Error", message: "No User")
                return
            }
            
            // now adding in user to the database
            let db = Database.database().reference()
            let usersNode = db.child("Users")
            guard let newUserId = usersNode.childByAutoId().key else {
                print("problem creating new usersNode child")
                return
            }// creates a unique id that is not already stored in the db - created a node
            let userNode = usersNode.child(newUserId) // now we traverse into it
            /* set value vs. updatechildvalue:
             *  setvalue deletes everything and sets a new value
             *  update value updates specific fields
             */
            userNode.updateChildValues(["email": email, "name": name, "phoneNumber": number])
            self.performSegue(withIdentifier: "toMainFeed", sender: self) // make sure to have the segue
        }
    }

    func handleLoginOrRegister() {
    //loginRegisterButton.isUserInteractionEnabled = false
        if loginRegisterSegControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func handleLoginRegisterChange(_ sender: Any) {
        handleLoginRegisterChange()
    }
    
    func handleLoginRegisterChange() {
        let index = loginRegisterSegControl.selectedSegmentIndex
        let title = loginRegisterSegControl.titleForSegment(at: index)
        loginRegisterButton.setTitle(title, for: UIControl.State())
        
        if title == "Login" {
            nameTextField.isHidden = true
            phoneNumberTextField.isHidden = true
        } else {
            nameTextField.isHidden = false
            phoneNumberTextField.isHidden = false
        }
    }
 
 */

}

