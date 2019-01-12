//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber = 0
    var score = 0
    var numOfQuestions = 0
    

    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numOfQuestions = self.allQuestions.list.count
        nextQuestion()
        progressLabel.text = "1/\(allQuestions.list.count)"
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {pickedAnswer=true} else if sender.tag == 2 {pickedAnswer = false}
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
     
        
    }
    
    
    func updateUI() {
        
        progressLabel.text = "\(questionNumber+1)/\(allQuestions.list.count)"
        scoreLabel.text = "Score : \(score)"
        progressBar.frame.size.width = (self.view.frame.size.width / 13) * CGFloat(self.questionNumber+1)
        
    }
    

    func nextQuestion() {
        
        
        if questionNumber < allQuestions.list.count{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        
        else{
            print("End of Quiz!")
            let alert = UIAlertController(title: "End of Quiz", message:"Would you like to try again?", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            alert.addAction(UIAlertAction(title: "Yea", style: UIAlertActionStyle.default, handler:{ (UIAlertAction) in
                self.startOver()
            }))
            
            alert.addAction(UIAlertAction(title: "Nope", style: UIAlertActionStyle.default, handler:{ (UIAlertAction) in
                self.startOver()
            }))
            
            
            self.present(alert,animated:true)
            questionNumber = 0
        }
        
        
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            
            ProgressHUD.showSuccess("Correct")
            
            score += 1
        }
        
        else{
            ProgressHUD.showError("Wrong")
        }
       
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
        updateUI()
       
    }
    

    
}
