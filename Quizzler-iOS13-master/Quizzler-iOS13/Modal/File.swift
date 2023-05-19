//
//  File.swift
//  Quizzler-iOS13
//
//  Created by Jaydip Goti on 27/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    var text : String
    var Ans : [String]
    var Anstext : String
    
    init( q : String, a : [String], correctAnswer : String){
        
        text = q
        Ans = a
        Anstext = correctAnswer
        
        
    }
    
    
    
    
    
    
}

