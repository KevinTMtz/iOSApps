//
//  WeatherManager.swift
//  Weather
//
//  Created by Kevin Torres on 17/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=958403eb465fdf9615bd082392037c6a&units=metric"
    var delegate: WeatherManagerDelegate?
    
    mutating func fetchWeather(cityName: String, delegate: WeatherManagerDelegate) {
        let urlStr = "\(weatherURL)&q=\(cityName)"
        self.delegate = delegate
        
        performRequest(with: urlStr)
    }
    
    func performRequest(with urlStr: String) {
        // Create URL
        if let url = URL(string: urlStr) {
            // Create URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            let description = decodedData.weather[0].description
            let id = decodedData.weather[0].id
            
            let weatherModel = WeatherModel(conditionId: id, cityName: cityName, temperature: temperature, description: description)
            return weatherModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
