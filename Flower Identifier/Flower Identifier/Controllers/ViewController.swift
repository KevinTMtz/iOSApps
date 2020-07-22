//
//  ViewController.swift
//  Flower Identifier
//
//  Created by Kevin Torres on 22/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mainImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userTakenPhoto = info[.editedImage] as? UIImage {
            mainImageView.image = userTakenPhoto
            
            guard let ciImage = CIImage(image: userTakenPhoto) else {
                fatalError("Unable to convert UIImage to CIImage.")
            }
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraTap(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func imageTap(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

