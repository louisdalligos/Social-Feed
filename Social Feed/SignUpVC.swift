//
//  SignUpVC.swift
//  Social Feed
//
//  Created by Louis on 19/10/2016.
//  Copyright © 2016 Wepro Co. Ltd. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SignUpVC: UIViewController {

    @IBOutlet weak var emailField: LeftPaddedTextField!
    @IBOutlet weak var passwordField: LeftPaddedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


    @IBAction func loginFBButtonTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            // error handling
            if error != nil {
                print("LOUIS: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("LOUIS: User cancelled Facebook authentication")
            } else {
                print("LOUIS: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential) // call firebase auth method
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            
            // error handling
            if error != nil {
                print("LOUIS: Unable to authenticate with Firebase - \(error)")
            } else {
                print("LOUIS: Successfully authenticated with Firebase")
            }
        })
        
    }

    @IBAction func loginBtnTapped(_ sender: AnyObject) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                
                // error handling
                if error == nil {
                    print("LOUIS: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion:  { (user, error) in
                        if error != nil {
                            print("LOUIS: Unable to authenticate with Firebase using email -\(error)")
                        } else {
                            print("LOUIS: Successfully authenticated with Firebase")
                        }
                    
                    })
                }
            
            })
            
        }
    }
}

