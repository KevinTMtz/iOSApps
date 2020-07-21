//
//  ViewController.swift
//  Food Identifier
//
//  Created by Kevin Torres on 20/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mainImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userTakenPhoto = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            mainImageView.image = userTakenPhoto
            
            guard let ciImage = CIImage(image: userTakenPhoto) else {
                fatalError("Unable to convert UIImage to CIImage.")
            }
            
            detect(image: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: SqueezeNet().model) else {
            fatalError("Could not load Core ML Model.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Could not get results from model.")
            }

            if let firstResult = results.first {
                if firstResult.identifier.contains("pizza") {
                    self.navigationItem.title = "It's pizza! 🍕"
                    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4311954379, green: 0.7108030915, blue: 0.2490257025, alpha: 1)
                } else {
                    self.navigationItem.title = "It's not pizza 🥺"
                    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6275507808, green: 0, blue: 0.03705629706, alpha: 1)
                }
            }
        }

        let handler = VNImageRequestHandler(ciImage: image)

        do {
            try handler.perform([request])
        } catch {
            print("Error: \(error)")
        }
    }
    
    @IBAction func cameraTap(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func libraryTap(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}
