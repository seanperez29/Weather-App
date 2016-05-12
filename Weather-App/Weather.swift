//
//  Weather.swift
//  Weather-App
//
//  Created by Sean Perez on 5/10/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _location: String!
    private var _state: String!
    private var _mainImg: UIImage!
    private var _currentTemp: String!
    private var _time: String!
    private var _day: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    private var _humidity: Int!
    private var _windSpeed: String!
    private var _nextDay1: String!
    private var _nextDay2: String!
    private var _nextDay3: String!
    private var _nextDay4: String!
    private var _mainCondition: String!
    private var _weatherUrl: String!
    private var _day1Condition: String!
    private var _day2Condition: String!
    private var _day3Condition: String!
    private var _day4Condition: String!
    private var _day1Img: UIImage!
    private var _day2Img: UIImage!
    private var _day3Img: UIImage!
    private var _day4Img: UIImage!
    
    var day1Img: UIImage {
        return _day1Img
    }
    
    var day2Img: UIImage {
        return _day2Img
    }
    
    var day3Img: UIImage {
        return _day3Img
    }
    
    var day4Img: UIImage {
        return _day4Img
    }
    
    var day1Condition: String {
        if _day1Condition == nil {
            return ""
        }
        return _day1Condition
    }
    
    var day2Condition: String {
        if _day2Condition == nil {
            return ""
        }
        return _day2Condition
    }
    
    var day3Condition: String {
        if _day3Condition == nil {
            return ""
        }
        return _day3Condition
    }
    
    var day4Condition: String {
        if _day4Condition == nil {
            return ""
        }
        return _day4Condition
    }
    
    var mainImg: UIImage {
        return _mainImg
    }
    
    var mainCondition: String {
        return _mainCondition
    }
    
    var weatherUrl: String {
        return _weatherUrl
    }

    var nextDay4: String {
        
        if _nextDay4 == nil {
            return ""
        }
        return _nextDay4
    }
    
    var nextDay3: String {
        
        if _nextDay3 == nil {
            return ""
        }
        return _nextDay3
    }
    
    var nextDay2: String {
        
        if _nextDay2 == nil {
            return ""
        }
        return _nextDay2
    }
    
    var nextDay1: String {
        
        if _nextDay1 == nil {
            return ""
        }
        return _nextDay1
    }
    
    var windSpeed: String {
        
        if _windSpeed == nil {
            return ""
        }
        return _windSpeed
    }
    
    var humidity: Int {
        
        if _humidity == nil {
            return 0
        }
        return _humidity
    }
    
    var lowTemp: String {
        
        if _lowTemp == nil {
            return ""
        }
        return _lowTemp
    }
    
    var highTemp: String {
        
        if _highTemp == nil {
            return ""
        }
        return _highTemp
    }
    
    var day: String {
        
        if _day == nil {
            return ""
        }
        return _day
    }
    
    var time: String {
        
        if _time == nil {
            return ""
        }
        return _time
    }
    
    var currentTemp: String {
        return _currentTemp
    }
    
    var state: String {
        
        if _state == nil {
            return ""
        }
        return _state
    }
    
    var location: String {
        
        if _location == nil {
            return ""
        }
        return _location
    }
    
    init(location: String) {
        
        self._location = location
        _weatherUrl = "\(BASE_URL)\(self._location)\(SECOND_URL)\(apiKey)"
     }
    
    func downloadWeatherDetail(completed: DownloadComplete) {
        
        if let nsurl = self._weatherUrl {
            if let url = NSURL(string: nsurl) {
                Alamofire.request(.GET, url).responseJSON { response in
                    let result = response.result
            
                    if let dict = result.value as? Dictionary<String, AnyObject> {
                
                        if let city = dict["city"] as? Dictionary<String, AnyObject> {
                            if let name = city["name"] as? String {
                                self._location = name
                                print(self._location)
                    
                            }
                        }
                        
                        if let weather = dict["list"] as? [Dictionary<String, AnyObject>] {
                            if let main = weather[0]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let condition = main[0]["main"] as? String {
                                    self._mainCondition = condition
                                    print(self._mainCondition)
                                    switch (condition) {
                                    case "Clear":
                                        self._mainImg = UIImage(named: "sun.png")
                                    case "Rain":
                                        self._mainImg = UIImage(named: "rain.png")
                                    case "Clouds":
                                        self._mainImg = UIImage(named: "cloudy.png")
                                    default:
                                        self._mainImg = UIImage(named: "sun.png")
                                    }
                                }
                            }

                            if let main = weather[8]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let condition = main[0]["main"] as? String {
                                    self._day1Condition = condition
                                    print(self._day1Condition)
                                    switch (condition) {
                                    case "Clear":
                                        self._day1Img = UIImage(named: "sun.png")
                                    case "Rain":
                                        self._day1Img = UIImage(named: "rain.png")
                                    case "Clouds":
                                        self._day1Img = UIImage(named: "cloudy.png")
                                    default:
                                        self._day1Img = UIImage(named: "sun.png")
                                    }
                                }
                            }
                            
                            if let main = weather[16]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let condition = main[0]["main"] as? String {
                                    self._day2Condition = condition
                                    print(self.day2Condition)
                                    switch (condition) {
                                    case "Clear":
                                        self._day2Img = UIImage(named: "sun.png")
                                    case "Rain":
                                        self._day2Img = UIImage(named: "rain.png")
                                    case "Clouds":
                                        self._day2Img = UIImage(named: "cloudy.png")
                                    default:
                                        self._day2Img = UIImage(named: "sun.png")
                                    }
                                }
                            }
                            
                            if let main = weather[24]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let condition = main[0]["main"] as? String {
                                    self._day3Condition = condition
                                    print(self._day3Condition)
                                    switch (condition) {
                                    case "Clear":
                                        self._day3Img = UIImage(named: "sun.png")
                                    case "Rain":
                                        self._day3Img = UIImage(named: "rain.png")
                                    case "Clouds":
                                        self._day3Img = UIImage(named: "cloudy.png")
                                    default:
                                        self._day3Img = UIImage(named: "sun.png")
                                    }
                                }
                            }
                            
                            if let main = weather[32]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let condition = main[0]["main"] as? String {
                                    self._day4Condition = condition
                                    print(self._day4Condition)
                                    switch (condition) {
                                    case "Clear":
                                        self._day4Img = UIImage(named: "sun.png")
                                    case "Rain":
                                        self._day4Img = UIImage(named: "rain.png")
                                    case "Clouds":
                                        self._day4Img = UIImage(named: "cloudy.png")
                                    default:
                                        self._day4Img = UIImage(named: "sun.png")
                                    }
                                }
                            }
                            
                            if let dt = weather[0]["dt"] as? Double {
                                let date = NSDate(timeIntervalSince1970: dt)
                                let dayFormatter = NSDateFormatter()
                                dayFormatter.dateFormat = "EEEE"
                                self._day = dayFormatter.stringFromDate(date)
                            }
                            
                            if let temp = weather[0]["main"] as? Dictionary<String, AnyObject> {
                                if let temperature = temp["temp"] as? Double {
                                    let faren = (temperature * 9/5 - 459.67)
                                    self._currentTemp = NSString(format: "%.0f", faren) as String
                                }
                                
                                if let tempMin = temp["temp_min"] as? Double {
                                    let faren = (tempMin * 9/5 - 459.67)
                                    self._lowTemp = NSString(format: "%.0f", faren) as String
                                }
                                
                                if let tempMax = temp["temp_max"] as? Double {
                                    let faren = (tempMax * 9/5 - 459.67)
                                    self._highTemp = NSString(format: "%.0f", faren) as String
                                }
                                
                                if let humidity = temp["humidity"] as? Int {
                                    self._humidity = humidity
                                }
                            }
                            
                            if let wind = weather[0]["wind"] as? Dictionary<String, AnyObject> {
                                if let speed = wind["speed"] as? Double {
                                    self._windSpeed = NSString(format: "%.0f", speed) as String
                                }
                            }
                            
                            if let dt = weather[8]["dt"] as? Double {
                                let date = NSDate(timeIntervalSince1970: dt)
                                let dayFormatter = NSDateFormatter()
                                dayFormatter.dateFormat = "EEEE"
                                self._nextDay1 = dayFormatter.stringFromDate(date)
                                print(self._nextDay1)
                                
                            }
                            
                            if let dt = weather[16]["dt"] as? Double {
                                let date = NSDate(timeIntervalSince1970: dt)
                                let dayFormatter = NSDateFormatter()
                                dayFormatter.dateFormat = "EEEE"
                                self._nextDay2 = dayFormatter.stringFromDate(date)
                            }
                            
                            if let dt = weather[24]["dt"] as? Double {
                                let date = NSDate(timeIntervalSince1970: dt)
                                let dayFormatter = NSDateFormatter()
                                dayFormatter.dateFormat = "EEEE"
                                self._nextDay3 = dayFormatter.stringFromDate(date)
                            }
                            
                            if let dt = weather[32]["dt"] as? Double {
                                let date = NSDate(timeIntervalSince1970: dt)
                                let dayFormatter = NSDateFormatter()
                                dayFormatter.dateFormat = "EEEE"
                                self._nextDay4 = dayFormatter.stringFromDate(date)
                            }
                        }
                    }
                    completed()
                }
            }
        }
    }
}
