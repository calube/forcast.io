//
//  ForecastService.swift
//  Forecast.me
//
//  Created by Caleb Davis on 11/9/16.
//  Copyright © 2016 Caleb Davis. All rights reserved.
//

import Foundation

class ForecastService
{
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String)
    {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.forecast.io/forecast/\(APIKey)/")
    }
    
    func getForecast(_ lat: Double, long: Double, completion: @escaping ((CurrentWeather?) -> Void))
    {
        if let forecastURL = URL(string: "\(lat),\(long)", relativeTo: forecastBaseURL!) {
            
            let networkOpereation = NetworkProcessing(url: forecastURL)
            
            networkOpereation.downloadJSONFromURL({ (jsonDictionary) -> Void in
                
                let currentWeather = self.currentWeatherFromJSON(jsonDictionary)
                completion(currentWeather)
            })
            
        }
    }
    
    func currentWeatherFromJSON(_ jsonDictionary: [String : AnyObject]?) -> CurrentWeather?
    {
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String : AnyObject] {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            print("JSON dictionary returned nil for the 'currently' key")
            return nil
        }
    }
    
}
