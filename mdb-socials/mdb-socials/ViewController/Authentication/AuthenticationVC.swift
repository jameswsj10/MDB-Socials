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
            
        //UserDefaults.standard.set(email, forKey: "name")
            
            
        let ref = Database.database().reference()
        let userRef = ref.child("Users")
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let usersDict = snapshot.value as? [String: [String: String]] else {
                print("friends error")
                return
            }
            for (userId, _) in usersDict {
                guard let userInfoDict = usersDict[userId] else {
                    print("friends error 2")
                    continue
                }
                
                if userInfoDict["email"]! == email {
                    let theUsersName = userInfoDict["name"]
                    UserDefaults.standard.set(theUsersName, forKey: "name")
                }
                
            }
        })
        
            
        self.performSegue(withIdentifier: "toFeedScreen", sender: self)
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }

}

