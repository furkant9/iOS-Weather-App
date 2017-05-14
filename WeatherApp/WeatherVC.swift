//
//  ViewController.swift
//  WeatherApp
//
//  Created by Furkan Tazegüllü on 08/05/2017.
//  Copyright © 2017 Furkan Tazegüllü. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather.downloadWeatherDetails {
            self.updateUI()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func updateUI() {
        conditionLabel.text = currentWeather.weatherType
        print(currentWeather.weatherType)
        print(currentWeather.date)
        print(currentWeather.cityName)
        print(currentWeather.currentTemp)
        conditionImageView.image = UIImage(named: currentWeather.weatherType)
        dateLabel.text = currentWeather.date
        locationLabel.text = currentWeather.cityName
        tempLabel.text = "\(currentWeather.currentTemp) °C"
    }
    

    

}

