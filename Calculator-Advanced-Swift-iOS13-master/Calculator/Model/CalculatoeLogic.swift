//
//  CalculatoeLogic.swift
//  Calculator
//
//  Created by Jaydip Goti on 01/03/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation
import UIKit


struct CalculatoeLogic{
    
    
    
   private var intermediateCalculation: (n1:Double, calcMethod:String)?
    
    
   private var number : Double?
    
    mutating func setnumber (_ number:Double){
        self.number = number
    }
    
    
    
    mutating func calculate(symbol:String) -> Double?{
        
        if let n = number {
        if symbol == "AC"{
            return 0
            
        }else if  symbol == "+/-" {
            return n + -1
        }
        else if symbol == "%"{
            return n / 100
        }
        else if symbol == "="{
           return performTwoNumcalulation(n2: n)
        }else{
            intermediateCalculation = (n1:n, calcMethod:symbol)
        }
        
        
        }
        return nil
    }
    
    
    
    func performTwoNumcalulation(n2:Double)-> Double?{
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod{
            
            switch operation{
            case "+":
                return n1 + n2
         
            case "-":
                return n1 - n2
  
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The oppression does not mach any oppression cases ")
                
        }
        }
        return nil
    }
    
    
    
    
    
    
    
    
}
