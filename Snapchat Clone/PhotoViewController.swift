//
//  PhotoViewController.swift
//  Snapchat Clone
//
//  Created by Rodrigo Eduardo Silva on 02/06/22.
//

import UIKit
import FirebaseStorage

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var DescriptionLabel: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

    }
    
    @IBAction func sendSnap(_ sender: Any) {
        self.sendButton.isEnabled = false
        self.sendButton.setTitle("Carregando..", for: .normal)
        let storageRef = Storage.storage().reference()
        let imagemStorage = storageRef.child("imagens")
        if let selectedImage = photoImage.image {
            if let imageData = selectedImage.jpegData(compressionQuality: 0.5) {
                imagemStorage.child("imagem.jpg").putData(imageData, metadata: nil) { metadatos , error in
                    if error == nil {
                       print("Sucesso ao fazer o upload do Arquivo")
                        self.sendButton.isEnabled = true
                        self.sendButton.setTitle("Próximo", for: .normal)
                    }else{
                      print("Erro ao fazer ao updload do Arquivo")
                    }
                }
            }
            
        }
        
        
    }
    
   
    @IBAction func choosePhoto(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoImage.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }

}
