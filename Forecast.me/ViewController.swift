//
//  ViewController.swift
//  Forecast.me
//
//  Created by Caleb Davis on 11/9/16.
//  Copyright © 2016 Caleb Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureScaleLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!

    
    // Testing Networking Processing
    let forecastAPIKey = "9e02622d7a2d86f0dedc01b966b54030"
    var coordinate: (lat: Double, long: Double) = (37.8267,-122.423)
    var name: String = ""
    var imageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: imageName)
        cityTextLabel.text = name
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) { (currentWeather) -> Void in
            if let currentWeather = currentWeather {
                // we want to update UI
                // BUT we are returning back from a different thread off the main queue
                // then, we have to go back onto the main q
                DispatchQueue.main.async(execute: { () -> Void in
                    if let temperature = currentWeather.temperature {
                        
                        self.temperatureLabel.text = "\(temperature)"
                    }
                })
            }
        }
        
    }


}

