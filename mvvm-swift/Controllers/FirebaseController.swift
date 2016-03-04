//
//  FirebaseController.swift
//  mvvm-swift
//
//  Created by Benjamin Hendricks on 3/3/16.
//  Copyright © 2016 coolbnjmn. All rights reserved.
//

import UIKit
import Firebase

class FirebaseController: NSObject {
    let fireRef = Firebase(url: "https://glowing-fire-1496.firebaseio.com/")
 
    let sharedInstance : FirebaseController = FirebaseController()
    private override init() {} // Singleton, only internal init rights
    
    func createUser(name: String, password: String, completion: ((Bool)->Void)?) {
        fireRef.createUser(name, password: password,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                    completion?(false)
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                    completion?(true)
                }
        })
    }
}
