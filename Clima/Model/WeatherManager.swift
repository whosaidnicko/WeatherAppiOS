//
//  WeatherManager.swift
//  Clima
//
//  Created by Nicolae Chivriga on 08/03/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ :WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error )
}

struct WeatherManager {
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=74d31098b34cf1d3d6ea284b6bd553f1&units=metric"
    
    var delegate: WeatherManagerDelegate?
    func fetchWeather(cityName: String) -> String{
        let urlString = "\(weatherUrl)&q=\(cityName)"
        return urlString
    }
    func fetchWeather(lat: CLLocationDegrees, lot: CLLocationDegrees) {
        let urlString = "\(weatherUrl)&lat=\(lat)&lon=\(lot)"
        fetchData(url: urlString)
        
    }
    
 
    
    func fetchData (url: String) {
        if let url = URL(string: url) {
            let session = URLSession.shared
            session.dataTask(with: url) { data, response, error in
               
                if let error = error {
                    self.delegate?.didFailWithError(error: error)
                  
                }
                if let data = data {
                    do
                    { let json = try JSONDecoder().decode(WeatherDate.self, from: data)
                        let weatherId = json.weather[0].id
                        let cityName = json.name
                        let temperature = json.main.temp
                       let  weatherModel = WeatherModel(condionId: weatherId, cityName: cityName, temp: temperature)
                        self.delegate?.didUpdateWeather(self, weather: weatherModel )
                        print(weatherModel.conditionName)
                        
                        
                    }
                    catch  {
                        delegate?.didFailWithError(error: error)
                       
                    }
                }
            }.resume()
        }
    }
    
}


