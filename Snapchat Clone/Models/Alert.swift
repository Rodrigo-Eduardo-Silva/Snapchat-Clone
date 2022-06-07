//
//  Alert.swift
//  Snapchat Clone
//
//  Created by Rodrigo Eduardo Silva on 06/06/22.
//

import Foundation
import UIKit


class Altert {
    var title: String
    var message: String
    
    init(title: String ,message: String){
        self.title = title
        self.message = message
    }
    
    func getAltert() -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        return alert
    }
}
