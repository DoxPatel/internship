//
//  WetherModel.swift
//  Clima
//
//  Created by Jaydip Goti on 01/02/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
struct Wethermodel{
    
    let cityname :String
    let citytemp : Double
    let ConditionID : Int
    
    var condishanname :String{
        switch ConditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
        
    }
   
    
}
