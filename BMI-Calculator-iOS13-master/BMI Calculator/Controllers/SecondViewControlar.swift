//
//  Secondviewcontrolar.swift
//  BMI Calculator
//
//  Created by Jaydip Goti on 30/01/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewControlar: UIViewController {
    
    var valu = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        let label = UILabel()
        label.text = valu
        label.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        view.addSubview(label)
        
        
    }
    
    
    
}
