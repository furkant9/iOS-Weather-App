//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Furkan Tazegüllü on 10/05/2017.
//  Copyright © 2017 Furkan Tazegüllü. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    private var _date: String!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Bugün, \(currentDate)"
        return _date
        
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEATHER)
        Alamofire.request(currentWeatherURL!).responseJSON{ response in
            let result = response.value
            if let dict = result as? Dictionary<String,AnyObject>{
                if let name = dict["name"] as? String{
                    self._cityName = name
                    //print(self._cityName)
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject>{
                    self._currentTemp = main["temp"] as? Double
                    //print(self.currentTemp)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>]{
                    self._weatherType = weather[0]["main"] as? String
                    //print(self._weatherType)
                }
                
                
            }
            completed()
        }
        
    }
}
