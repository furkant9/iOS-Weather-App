//
//  Constants.swift
//  WeatherApp
//
//  Created by Furkan Tazegüllü on 10/05/2017.
//  Copyright © 2017 Furkan Tazegüllü. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let UNITS = "&units="
let CURRENT_WEATHER = "\(BASE_URL)\(LATITUDE)40.9361634\(LONGITUDE)40.2767495\(APP_ID)\(API_KEY)\(UNITS)metric"
typealias DownloadComplete = () -> ()
