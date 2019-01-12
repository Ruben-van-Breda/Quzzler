//
//  Question.swift
//  Quizzler
//
//  Created by Ruben van Breda on 1/11/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer: Bool){
        
        questionText = text
        answer  = correctAnswer
        
    }
    
}

