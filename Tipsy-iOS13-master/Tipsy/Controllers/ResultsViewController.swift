//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jaydip Goti on 30/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var totallabel: UILabel!
    
    @IBOutlet weak var settinglabel: UILabel!
    
    var Result : String = ""
    var Detiles : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totallabel.text = Result
        settinglabel.text = Detiles

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateproses(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
  

}
