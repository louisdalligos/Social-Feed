//
//  FeedVC.swift
//  Social Feed
//
//  Created by Louis on 19/10/2016.
//  Copyright © 2016 Wepro Co. Ltd. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logOutBtnTapped(_ sender: AnyObject) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: "KEY_UID")
        print("LOUIS: ID removed from Keychain - \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignUp", sender: nil)
    }
    

}
