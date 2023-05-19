//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var secondsRemaining : Int = 0
    var primarinumber : Int = 0
    
    @IBOutlet weak var pogresbar: UIProgressView!
    let eggtime = ["softtime": 1,"MediumTime": 2,"HardTime": 12 ]

    @IBOutlet weak var Titilelabel: UILabel!
    
    @IBAction func eggbutton(_ sender: UIButton) {
        
        let egg : String = sender
            .currentTitle ?? ""
        Eggbut(titel: egg)
    }
    
    
    func Eggbut(titel: String){
        
//        if titel == "Soft"{
//            print(softTime)
//        }
//
//        else if titel == "Medium"{
//            print(MediumTime)
//        }
//
//        else if titel == "Hard"{
//            print(HardTime)
//        }
        var a : Int = 0
        
        switch titel {
        case "Soft" :  a = eggtime["softtime"]!
        case "Medium" : a = eggtime["MediumTime"]!
        case "Hard" : a = eggtime["HardTime"]!
        default:
            print("Some thing wrong")
        }
        secondsRemaining = 3
       
        var c : Float = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self]
            (Timer) in
               if self.secondsRemaining > primarinumber {
                   print ("\(self.primarinumber) seconds")
                   
                   
                   self.primarinumber += 1
                   print(primarinumber)
                   let d : Float = Float(secondsRemaining)
                   c = Float(primarinumber)/d
                print(c)
                   self.pogresbar.progress = c
                  
               } else {
                   Timer.invalidate()
                   primarinumber = 0
                   self.Titilelabel.text = "Done"
               }
           }
             
        
        
        
    }
    

    
    
}
