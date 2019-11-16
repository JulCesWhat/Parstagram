//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Julio Cesar Whatley on 11/15/19.
//  Copyright © 2019 Capi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginBtn(_ sender: Any) {
        if let username = usernameField.text, let password = passwordField.text {
            PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    print("Error while login up => \(error)")
                }
            }
        }
    }
    
    @IBAction func onSignupBtn(_ sender: Any) {
        if let username = usernameField.text, let password = passwordField.text  {
            let user = PFUser()
            user.username = username
            user.password = password
            
            user.signUpInBackground(block: { (success, error) in
                if success {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                     print("Error while singing up => \(error)")
                }
            })
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
