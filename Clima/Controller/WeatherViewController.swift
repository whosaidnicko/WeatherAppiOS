//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController{
   
    
    @IBOutlet weak var searchTextField: UITextField!
    
   
    @IBOutlet weak var conditionViewImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var  managerLocation =  CLLocationManager()
    var weatherManager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        managerLocation.delegate = self
        managerLocation.requestAlwaysAuthorization()
        managerLocation.requestLocation()
        
     
        weatherManager.delegate = self
        searchTextField.delegate = self
        
    }
    @IBAction func locationPressed(_ sender: UIButton) {
        managerLocation.requestLocation()
    }
}

//MARK: - UITEXTFIELD Delegate
extension WeatherViewController: UITextFieldDelegate{
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(false)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        }
        else {
            
            searchTextField.placeholder = "Hey! Type something!"
            
            return false
            
            
        }
      
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            
            let name = weatherManager.fetchWeather(cityName: city)
            weatherManager.fetchData(url: name)
            
            
            
          
            
        }
        searchTextField.text = ""
      
        
    }

}
//MARK: - WeatherManagerDelagate
extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.tempString
            self.cityLabel.text = weather.cityName
            self.conditionViewImage.image =  UIImage(systemName: weather.conditionName)
        }
    
    }
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
//MARK: - Location Delegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            managerLocation.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print(lat)
            print(lon)
            weatherManager.fetchWeather(lat: lat, lot: lon)
          
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      didFailWithError(error: error)
    }
    
}
