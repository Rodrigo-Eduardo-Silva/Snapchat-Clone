//
//  ViewController.swift
//  Snapchat Clone
//
//  Created by Rodrigo Eduardo Silva on 28/04/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let auth = Auth.auth()
    
//        do {
//            try auth.signOut()
//        } catch {
//            fatalError()
//        }
        auth.addStateDidChangeListener { auth, user in
            if let userLoaged = user {
                self.performSegue(withIdentifier: "screenMainSegue", sender: nil)
            }
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }


}

