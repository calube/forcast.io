//
//  CitiesTableViewController.swift
//  Forecast.me
//
//  Created by Caleb Davis on 11/9/16.
//  Copyright © 2016 Caleb Davis. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {

    var lat: Double = 0.0
    var long: Double = 0.0
    var name: String = ""
    var imageName: String = ""
    var cities: [City] = []
    var selectedCity: City? {
        didSet{
            lat = (selectedCity?.lat)!
            long = (selectedCity?.long)!
            name = (selectedCity?.name)!
            imageName = (selectedCity?.vcImageBackgroundName)!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       cities = setupCities()
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height -
            self.navigationController!.navigationBar.frame.height
        
        self.tableView.rowHeight = screenHeight / CGFloat(cities.count)

    }

    func setupCities() -> [City] {
        let la: City = City(name: "Los Angeles", bg: "los-angeles-2", tvcBG: "la-tvc-bg", lat: 34.052235, long: -118.243683)
        let sf: City = City(name: "San Francisco", bg: "bg", tvcBG: "san-fran-tableCell", lat: 37.773972, long: -122.431297)
        let portland: City = City(name: "Portland", bg: "portland-night-made-in-oregon", tvcBG: "portland", lat: 45.548325, long: -122.588303)
        let nyc: City = City(name: "New York", bg: "pexels-photo-30360-large", tvcBG: "ny-tvc-bg", lat: 40.758896, long: -73.985130)
        cities.append(la); cities.append(sf); cities.append(nyc); cities.append(portland)
        return cities
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityTableViewCell
        
        let city = cities[indexPath.row]
        cell.backgroundImageView.image = UIImage(named: city.tvcImageBackgroundName)
        cell.nameLabel.text = city.name

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity = cities[indexPath.row]
        performSegue(withIdentifier: "showTemp", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTemp" {
            if let controller = segue.destination as? ViewController {
                controller.coordinate = (lat, long)
                controller.name = name
                controller.imageName = imageName
            }
        }
        
    }


}
