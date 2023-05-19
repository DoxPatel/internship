//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Jaydip Goti on 30/01/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit


struct CalculatorBrain{
    
    var BMILAbel : String = "a"
    var BMICOlore : UIColor = .cyan
    
    mutating func calculatBMI (hight : Float , weight : Float) -> Float {
       
        let BMI = weight/pow(hight, 2)
      
        return BMI
    }
    
    
    mutating func bg(Bmivalu:Float){
        print(Bmivalu)

        switch Bmivalu {
        case 0...18.5 :
            BMILAbel = "underweight"
            BMICOlore = .blue
            
        case 18.6...24.9 :
            BMILAbel = "Normal"
            BMICOlore = .green
            
            
        default:
            BMILAbel = "Overweight"
            BMICOlore = .red
        }
        
        
        
        
    }
    
    
    
}
