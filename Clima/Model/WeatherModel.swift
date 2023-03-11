//
//  WeatherModel.swift
//  Clima
//
//  Created by Nicolae Chivriga on 09/03/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let condionId: Int
    let cityName: String
    let temp: Double
    
    var tempString: String {
        return String(format: "%.1f", temp)
    }
    
    var conditionName: String {
        switch condionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...701:
            return "cloud.snow"
        case 800:
            return "cloud.fog"
        case 801...804:
            return "sun.max"
        default:
            return "cloud"
        }
    }
}
/*
"cloud.bolt" case 200...232:
"cloud.drizzle" case 300...321:
"cloud.rain" 500...531:
600...622:
"clound.snow" 700...781:
"cloud.fog" 800:
"sun.max" 801...804:
"cloud.bolt"
 */
