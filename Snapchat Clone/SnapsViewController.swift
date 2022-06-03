//
//  SnapsViewController.swift
//  Snapchat Clone
//
//  Created by Rodrigo Eduardo Silva on 02/06/22.
//

import UIKit
import FirebaseAuth

class SnapsViewController: UIViewController {
    let auth = Auth.auth()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Logout(_ sender: Any) {
                do {
                    try auth.signOut()
                    dismiss(animated: true, completion: nil)
                } catch {
                    fatalError()
                }
    }
    
}
