//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    
    
    @IBOutlet weak var SearchTextfield: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var Wethermanager = weathermanager()
    let LocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchTextfield.delegate = self
        Wethermanager.delegate = self
   
        LocationManager.delegate = self
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.requestLocation()
        
      
    }
    
  
    
}

//MARK: - UiTextFieldDelegate

extension WeatherViewController : UITextFieldDelegate {
    
    @IBAction func Searchpreshed(_ sender: UIButton) {
        SearchTextfield.endEditing(true)
        Wethermanager.Cityname(cityname: SearchTextfield.text!)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        Wethermanager.Cityname(cityname: SearchTextfield.text!)
        SearchTextfield.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchTextfield.endEditing(true)
        return false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Type something"
            return false
        }
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController : WeatherManagerDelegate {
    
    
    func didUpdateWeather(weather: Wethermodel){
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = String(format: "%.1f", weather.citytemp)
            self.cityLabel.text = weather.cityname
            self.conditionImageView.image = UIImage(systemName: weather.condishanname)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error )
    }
    
}

//MARK: - Curunt  Location

extension WeatherViewController : CLLocationManagerDelegate{

    @IBAction func Curentlocasn(_ sender: UIButton) {
        LocationManager.requestLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last{
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("latitude\(lat),,longitude\(lon)")
            Wethermanager.fechdata(lat: lat, lon: lon)
        }
    }
   
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
