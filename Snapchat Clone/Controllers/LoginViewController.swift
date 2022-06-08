//
//  LoginViewController.swift
//  Snapchat Clone
//
//  Created by Rodrigo Eduardo Silva on 31/05/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        if let userEmail = self.emailTextField.text,
           let password = self.passwordTextFiled.text {
           let auth = Auth.auth()
            auth.signIn(withEmail: userEmail, password: password) { user, error in
                if error == nil {
                    if user == nil{
                        self.showLoginError(message: "Problema ao realizar a autenticação , tente novamente. ")
                    }else{
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    }
                }else{
                    if let error = error as NSError? {
                        self.showLoginError(message: error.localizedDescription)
                    }
                }
            }
        }
        
    }
    func showLoginError(message: String) {
        let alert = UIAlertController(title: "Falha de login", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Cancelar", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
    
    func showLoginSuccess(message: String) {
        let alert = UIAlertController(title: "Sucesso", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
    
   
}
