//
//  AddNewAccountViewController.swift
//  Snapchat Clone
//
//  Created by Rodrigo Eduardo Silva on 31/05/22.
//

import UIKit
import Firebase

class AddNewAccountViewController: UIViewController {
    
    @IBOutlet weak var newAddEmailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var ConfirmPasswordText: UITextField!
    @IBOutlet weak var userNane: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddNewAccount(_ sender: Any) {
        if let email = self.newAddEmailText.text , let password = self.passwordText.text, let confirmPassword  = self.ConfirmPasswordText.text {
            if password == confirmPassword {
                let authentication = Auth.auth()
                authentication.createUser(withEmail: email, password: password) { user, error in
                    if error == nil{
                        if user == nil{
                            
                        }else{
                            self.performSegue(withIdentifier: "addNewAcountSegue", sender: nil)
                        }
                    }else{
                        if let error = error as NSError? {
                            self.showLoginError(message: error.localizedDescription)
                        }
                    }
                }
                print ( "Ok Next step")
            }else {
                self.showLoginError(message: "As senha devem ser iguais")
            }
        }
        
        
        
    }
    
    func showLoginError(message: String) {
        let alert = UIAlertController(title: "Falha de login", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Cancelar", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
    
}
