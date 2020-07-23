//
//  ViewController.swift
//  Flower Identifier
//
//  Created by Kevin Torres on 22/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userTakenPhoto = info[.editedImage] as? UIImage {
            //mainImageView.image = userTakenPhoto
            
            guard let ciImage = CIImage(image: userTakenPhoto) else {
                fatalError("Unable to convert UIImage to CIImage.")
            }
            
            detect(image: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        // FlowerClassifier its how I called the oxford102.caffemodel converted model
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Could not load Core ML Model.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("Could not get results from model.")
            }
            
            self.retrieveInfo(flowerName: classification.identifier)
            self.navigationItem.title = classification.identifier.capitalized
        }

        let handler = VNImageRequestHandler(ciImage: image)

        do {
            try handler.perform([request])
        } catch {
            print("Error: \(error)")
        }
    }
    
    func retrieveInfo(flowerName: String) {
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pithumbsize" : "1000"
        ]
        
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                let flowerJSON = JSON(response.result.value!)
                
                let pageId = flowerJSON["query"]["pageids"][0].stringValue
                
                let flowerDescription = flowerJSON["query"]["pages"][pageId]["extract"].stringValue
                
                let flowerImgUrl = flowerJSON["query"]["pages"][pageId]["thumbnail"]["source"].stringValue
                
                self.mainImageView.sd_setImage(with: URL(string: flowerImgUrl))
                
                self.infoLabel.text = flowerDescription
            }
        }
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

