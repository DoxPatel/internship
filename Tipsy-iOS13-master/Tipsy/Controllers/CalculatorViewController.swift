//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var Splitrnumberlabel: UILabel!
    @IBOutlet weak var twentypcbutton: UIButton!
    @IBOutlet weak var tenpersintbutton: UIButton!
    @IBOutlet weak var zeropersantizebuuton: UIButton!
    @IBOutlet weak var billtextFiels: UITextField!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }

    
    var a : String = ""
    var Tipamount : Float = 0.0
    @IBAction func tipchanged(_ sender: UIButton) {
        twentypcbutton.isSelected = false
        tenpersintbutton.isSelected = false
        zeropersantizebuuton.isSelected = false
        sender.isSelected = true
        a = sender.currentTitle ?? ""
        a.removeLast()
        let h = Int(a) ?? 0
       Tipamount = Float(Float(h)/100)
        
    
    }
    
    
    @IBAction func steppervaluchange(_ sender: UIStepper) {
        
        Splitrnumberlabel.text = String(Int(sender.value))
        
               
    }
    var Split : Float = 0.0
    
    
    @IBAction func calculateprese(_ sender: UIButton) {
        billtextFiels.endEditing(true)
      
        if billtextFiels.text != "" {
            
            let Billamount = billtextFiels.text!
            
            let tipadd : Float = Float(Billamount)! * Tipamount
            
            let final : Float = Float(Billamount)! + tipadd
            
             Split = final / Float(Splitrnumberlabel.text!)!
            
          
            
            self.performSegue(withIdentifier: "gotoresuits", sender: self)
            
        
        }
        else{
            print("Please Enter Amount")
            billtextFiels.endEditing(false)
        }
      
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let SecondVC = segue.destination as! ResultsViewController
        SecondVC.Result = String(format: "%.2f", Split)
        let c = Splitrnumberlabel.text
        SecondVC.Detiles = "Split between \(c!) people, with \(a)% tip."
        
    }
    

}

