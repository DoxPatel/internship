//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedtyping:Bool = true
    
    
    
    private var displayValu : Double{
        
        get {
            guard let number = Double(displayLabel.text!) else{
                fatalError("Connot convert display label text to a Double.")}
            return number
        }
        set{
            displayLabel.text = String(newValue)
            
        }
        
        
    }
    private var  calculator = CalculatoeLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        
        isFinishedtyping = true
        calculator.setnumber(displayValu)
        
        if let calacMethod = sender.currentTitle{
            
           
            
            if let result = calculator.calculate(symbol: calacMethod) {
                displayValu = result
            }
            
            
            
        }
    }
    //    var h = ""
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let number = sender.currentTitle{
            
            if isFinishedtyping{
                displayLabel.text = number
                isFinishedtyping = false
            }else{
                
                
                let isInt = floor(displayValu) == displayValu
                
                if !isInt{
                    return
                }
                
                displayLabel.text = displayLabel.text! + number
                
                
            }
            
        }
        
    }
    
}

