//
//  ViewController.swift
//  Weather
//
//  Created by Kevin Torres on 17/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var weatherSearchTextfield: UITextField!
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherTemperatureLabel: UILabel!
    @IBOutlet weak var weatherLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherSearchTextfield.delegate = self
    }
    
    // After pressing enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search()
        return true
    }
    
    // After end editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        weatherSearchTextfield.text = ""
    }
    
    // Allow user to end editing
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if weatherSearchTextfield.text != "" {
            weatherSearchTextfield.placeholder = "Search"
            return true
        }
        weatherSearchTextfield.placeholder = "Type something"
        return false
    }
    
    @IBAction func searchPress(_ sender: UIButton) {
        search()
    }
    
    func search() {
        weatherSearchTextfield.endEditing(true)
    }
}

