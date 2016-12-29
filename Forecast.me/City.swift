//
//  City.swift
//  Forecast.me
//
//  Created by Caleb Davis on 11/9/16.
//  Copyright © 2016 Caleb Davis. All rights reserved.
//

import Foundation

struct City {
    var name: String
    var vcImageBackgroundName: String
    var tvcImageBackgroundName: String
    var lat: Double
    var long: Double
    
    init(name: String, bg: String, tvcBG: String, lat: Double, long: Double) {
        self.name = name
        self.vcImageBackgroundName = bg
        self.tvcImageBackgroundName = tvcBG
        self.lat = lat
        self.long = long
    }
}
