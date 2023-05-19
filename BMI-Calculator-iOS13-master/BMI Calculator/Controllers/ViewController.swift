//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Bmi = CalculatorBrain()
    
    @IBOutlet weak var heightlabel: UILabel!
    @IBOutlet weak var Weightlabel: UILabel!
    @IBOutlet weak var Weightslider: UISlider!
    @IBOutlet weak var Heightslider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func Heightslide(_ sender: UISlider) {
       
        heightlabel.text = "\(String(format: "%.2f",sender.value)) m"
        
    }
    
    @IBAction func Weightslid(_ sender: UISlider) {
        
        Weightlabel.text = "\(String(format: "%.2f",sender.value)) Kg"
    }
    var BMI : Float = 0.0
   
    @IBAction func CalculateBMI(_ sender: UIButton) {
        
        let Hight = Heightslider.value
        let Wight = Weightslider .value
        
      BMI = Bmi.calculatBMI(hight: Hight, weight: Wight)
         Bmi.bg(Bmivalu: BMI)
     
       
        
        self.performSegue(withIdentifier: "gotoresult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.valu = String(format: "%.2f", BMI)
        destinationVC.BMIlab = Bmi.BMILAbel
        destinationVC.BMIColore = Bmi.BMICOlore
    }
    
}

