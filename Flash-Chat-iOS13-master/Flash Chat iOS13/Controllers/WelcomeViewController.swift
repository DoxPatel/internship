//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        let charttext = "⚡️FlashChat"
        var count = 0.0
        for chart in charttext{
            Timer.scheduledTimer(withTimeInterval: 0.1 * count, repeats: false) { (timer) in
                self.titleLabel.text?.append(chart)
            }
            count += 1
            
        }

       
    }
    

}
