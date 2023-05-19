//
//  Weathermanager.swift
//  Clima
//
//  Created by Jaydip Goti on 01/02/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


protocol WeatherManagerDelegate {
    
func didUpdateWeather(weather: Wethermodel)
    func didFailWithError(error:Error )
    
}


struct weathermanager{
    
    
   
    let weatherURl = "https://api.openweathermap.org/data/2.5/weather?appid=10f3635bb775ef3ec19c42d7c06b7b49&units=metric"
    
    var delegate : WeatherManagerDelegate!
    
    func Cityname(cityname : String){
        
        
        let urlstring = "\(weatherURl)&q=\(cityname)"
        print(urlstring)
        performRequest(urlString: urlstring)
        
        
    }
    func fechdata(lat:CLLocationDegrees,lon:CLLocationDegrees){
        
        let urlstring = "\(weatherURl)&lat=\(lat)&lon=\(lon)"
        performRequest(urlString: urlstring)
        
    }
    
    
    func performRequest(urlString : String){
        
        if let url = URL(string: urlString){
            
            
            let session = URLSession(configuration: .default)
          
            let sessionTask = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    delegate.didFailWithError(error: error!)
                    return
                }
                
                if let safedata = data{
                    
                    if let weathers = self.parsesJHON(weatherdata: safedata){
                        print(weathers.ConditionID)
                        self.delegate.didUpdateWeather(weather: weathers)
                    }
                }
            }
            sessionTask.resume()
        }
    }
     
    
    func parsesJHON(weatherdata:Data)-> Wethermodel?{
        let decode = JSONDecoder()
        do{
            let decodedata = try decode.decode(Weatherdata.self, from: weatherdata)
            
          let temp = decodedata.main.temp
            let id = decodedata.weather[0].id
            let city = decodedata.name
            
             let weather = Wethermodel(cityname: city, citytemp: temp, ConditionID: id)
           return weather
        }
    catch{
        delegate.didFailWithError(error: error)
        return nil
    }
    }
    
   
    
    
}
