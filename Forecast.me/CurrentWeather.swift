//
//  CurrentWeather.swift
//  Forecast.me
//
//  Created by Caleb Davis on 11/9/16.
//  Copyright © 2016 Caleb Davis. All rights reserved.
//

import Foundation

class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    init(weatherDictionary: [String : AnyObject])
    {
        temperature = weatherDictionary["temperature"] as? Int
        
        if let humidityDouble = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary["precipProbability"] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary["summary"] as? String
    }
}

