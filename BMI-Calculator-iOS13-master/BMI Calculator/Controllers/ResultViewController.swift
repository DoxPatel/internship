//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Jaydip Goti on 30/01/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var BMIlabel: UILabel!
    var valu = String()
    var BMIlab = String()
    var BMIColore = UIColor()
    
    @IBOutlet weak var Resultlabel: UILabel!
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        Resultlabel.text = valu
        BMIlabel.text = BMIlab
        BMIlabel.textColor = BMIColore
        
    }
    
    @IBAction func Recalculate(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
 
}
