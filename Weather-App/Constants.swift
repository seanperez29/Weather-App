//
//  Constants.swift
//  Weather-App
//
//  Created by Sean Perez on 5/10/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/forecast?q="
let SECOND_URL = ",us&mode=json&appid="
let apiKey = "6105c93cb9de91b8c32b2c09656e8ce5"

typealias DownloadComplete = () -> ()