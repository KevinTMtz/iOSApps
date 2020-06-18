//
//  ViewController.swift
//  Weather
//
//  Created by Kevin Torres on 17/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var weatherManager = WeatherManager()
    
    @IBOutlet weak var weatherSearchTextfield: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var weatherTemperatureLabel: UILabel!
    @IBOutlet weak var weatherLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        weatherSearchTextfield.delegate = self
        
        weatherManager.fetchWeather(cityName: "Bern", delegate: self)
    }
}

// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPress(_ sender: UIButton) {
        endEditing()
    }
    
    // After end editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = weatherSearchTextfield.text {
            weatherManager.fetchWeather(cityName: city, delegate: self)
        }
        
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
    
    // After pressing enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
    
    func endEditing() {
        weatherSearchTextfield.endEditing(true)
    }
}

// MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.weatherConditionLabel.text = weather.description.capitalizingFirstLetter()
            self.weatherImage.image = UIImage(systemName:  weather.conditionName)
            self.weatherTemperatureLabel.text = weather.temperatureStr
            self.weatherLocationLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
