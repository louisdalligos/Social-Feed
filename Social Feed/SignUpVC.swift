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

}

