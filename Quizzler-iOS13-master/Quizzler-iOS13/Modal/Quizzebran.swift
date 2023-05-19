//
//  Quizzebran.swift
//  Quizzler-iOS13
//
//  Created by Jaydip Goti on 27/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Quizzebran {
    
    
    let quies = [
        
        Question(q: "Which is the largest organ  in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
               Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
               Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
               Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
               Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
               Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
               Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
               Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
               Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia"),
        

        
        
    ]
    var number = 0
    var score = 0
     
    mutating func cheakanser(_ anser:String) -> Bool{
        print(quies[number].Anstext)
        if anser == quies[number].Anstext{
            
            score += 1
           return true
        }
        else{
           return false
        }
        
        
    }
    
    func qusetext() -> String{
        let an = quies[number].text
        return an
    }
    
    func ansertext() -> [String]{
        let callA  = quies[number].Ans
        return callA
    }
    
    
    func pointer() -> Float{
        let point : Float = Float(number+1)/Float(quies.count)
         return point
    }
    
    mutating func numberchek(){
        if number+1 < quies.count {
            number += 1
            
        }
        else{
            number = 0
            score = 0
        }
    
    }
    
    
    
}

