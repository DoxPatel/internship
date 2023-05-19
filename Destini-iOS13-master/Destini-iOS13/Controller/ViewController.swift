//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acshan()

    }
    
    var Ques = Storybrain()
    
    
    @IBAction func Anserbutton(_ sender: UIButton) {
        Ques.ansercheck(sender.currentTitle!)
        update()
    }
    
    func update(){
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(acshan), userInfo: nil, repeats: false)
            }
    
    @objc func acshan(){
        
        storyLabel.text = Ques.Qusen[Ques.numbercounting()].title
        choice1Button.setTitle(Ques.Qusen[Ques.numbercounting()].choice1, for: .normal)
        choice2Button.setTitle(Ques.Qusen[Ques.numbercounting()].choice2, for: .normal)
        
    }
    }

