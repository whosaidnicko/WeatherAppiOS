//
//  WeatherModel.swift
//  Clima
//
//  Created by Nicolae Chivriga on 08/03/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherDate: Decodable {
    let name: String
    let main : Main
    let weather: [Weather]
}

struct Main: Decodable{
    let temp : Double
    
    
    
}


struct Weather: Decodable {
    let id : Int
    let description: String
}
