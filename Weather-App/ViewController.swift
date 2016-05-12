//
//  ViewController.swift
//  Weather-App
//
//  Created by Sean Perez on 5/10/16.
//  Copyright © 2016 Sean Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var currentTimeLbl: UILabel!
    @IBOutlet weak var currentDayLbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var day1Lbl: UILabel!
    @IBOutlet weak var day1Img: UIImageView!
    @IBOutlet weak var day2Lbl: UILabel!
    @IBOutlet weak var day2Img: UIImageView!
    @IBOutlet weak var day3Lbl: UILabel!
    @IBOutlet weak var day3Img: UIImageView!
    @IBOutlet weak var day4Lbl: UILabel!
    @IBOutlet weak var day4Img: UIImageView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var weather: Weather!
    var userLocation: String!
    var currentTime = CurrentDateAndTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBtn.layer.cornerRadius = 5.0
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        let timeString = "\(dateFormatter.stringFromDate(NSDate()))"
        
        //currentTimeLbl.text = currentTime.currentTime
        
        currentTimeLbl.text = "\(timeString)"
        
        searchTextField.delegate = self
    
        weather = Weather(location: "miami")
        weather.downloadWeatherDetail {
            self.updateUI()
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func updateUI() {
        locationLbl.text = weather.location
        currentWeatherImg.image = weather.mainImg
        currentTempLbl.text = "\(weather.currentTemp)°"
        currentDayLbl.text = weather.day
        highTempLbl.text = weather.highTemp
        lowTempLbl.text = weather.lowTemp
        windSpeedLbl.text = weather.windSpeed
        day1Lbl.text = weather.nextDay1.stringByPaddingToLength(3, withString: "", startingAtIndex: 0)
        day2Lbl.text = weather.nextDay2.stringByPaddingToLength(3, withString: "", startingAtIndex: 0)
        day3Lbl.text = weather.nextDay3.stringByPaddingToLength(3, withString: "", startingAtIndex: 0)
        day4Lbl.text = weather.nextDay4.stringByPaddingToLength(3, withString: "", startingAtIndex: 0)
        day1Img.image = weather.day1Img
        day2Img.image = weather.day2Img
        day3Img.image = weather.day3Img
        day4Img.image = weather.day4Img
        humidityLbl.text = "\(weather.humidity)%"
        
    }

    @IBAction func searchBtnPressed(sender: AnyObject) {
        
        if searchTextField.text != nil && searchTextField.text != "" {
            
            userLocation = (searchTextField.text?.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: ""))!
            weather = Weather(location: self.userLocation)
            weather.downloadWeatherDetail({ 
                self.updateUI()
            })
            
            view.endEditing(true)
            searchTextField.text = ""
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

