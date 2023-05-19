//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var imgbutton: UIButton!
    let ballArray = ["ball1","ball2","ball3","ball4","ball5"]

    override func viewDidLoad() {
        imgbutton.addTarget(self, action: #selector(imagebutton), for: .touchUpInside)
    }
    
    @objc func imagebutton(_ sender : UIButton){
        
        let a = Int.random(in: 0...4)
        image.image = UIImage(named: ballArray[a])
        print(ballArray[a])
    }


}

