//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var alloption: UIButton!
    @IBOutlet weak var Optionfast: UIButton!
    @IBOutlet weak var Scorelabel: UILabel!
    @IBOutlet weak var Progresbar: UIProgressView!
    @IBOutlet weak var Optionthard: UIButton!
    @IBOutlet weak var Optionsecond: UIButton!
    @IBOutlet weak var Qushenlabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
       
        // Do any additional setup after loading the view.
    }
    var quies = Quizzebran().quies
    var Quies = Quizzebran()
   
    
    @IBAction func button(_ sender: UIButton) {
        
        let a : String = sender.currentTitle!
            let anse = Quies.cheakanser(a)
            if anse{
                sender.backgroundColor = UIColor.green
            }
            else{
                sender.backgroundColor = UIColor.red
            }
        Quies.numberchek()
       update()
        
    }
    
    @objc func actbutton(){
        Optionfast.backgroundColor = UIColor.clear
        Optionsecond.backgroundColor = UIColor.clear
        Optionthard.backgroundColor = UIColor.clear
        Qushenlabel.text = Quies.qusetext()
        Progresbar.progress = Quies.pointer()
        Optionfast.setTitle(Quies.ansertext()[0], for: .normal)
        Optionsecond.setTitle(Quies.ansertext()[1], for: .normal)
        Optionthard.setTitle(Quies.ansertext()[2], for: .normal)
        Scorelabel.text = "Score: \(Quies.score)"
        
    }
    
    func update(){
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(actbutton), userInfo: nil, repeats: false)
        
    }
    
    
}

