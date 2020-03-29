//
//  ViewController.swift
//  BasicQuizApp
//
//  Created by Ankur Rajput on 29/03/20.
//  Copyright © 2020 Ankur Rajput. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ivQuiz: UIImageView!
    @IBOutlet weak var lbQuestion: UILabel!
    
    let quiz = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
    }
    
    func setupQuestions() {
        let currentQuestion = quiz.getQuestion()
        ivQuiz.image = currentQuestion.image
        lbQuestion.text = currentQuestion.question
    }
    
    @IBAction func trueButtonClicked(_ sender: Any) {
        let result = quiz.check(answer: true)
        showResult(isCorrect: result)
    }
    
    @IBAction func falseButtonClicked(_ sender: Any) {
        let result = quiz.check(answer: false)
        showResult(isCorrect: result)
    }
    
    func showResult(isCorrect correct:Bool) {
        let title = correct ? "Correct" : "Incorrect"
        let messgae = correct ? "You got a correct answer" : "You got an incorrect answer"
        
        let alert = UIAlertController(title: title, message: messgae, preferredStyle: .alert)
        let nextQuestionAction = UIAlertAction(title: "Next", style: .default) { (action) in
            if self.quiz.nextQuestion() {
                self.setupQuestions()
                alert.dismiss(animated: true, completion: nil)
            } else {
                alert.dismiss(animated: true, completion: nil)
                self.showFinalScore()
            }
            
        }
        alert.addAction(nextQuestionAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFinalScore() {
        let alert = UIAlertController(title: "Final Score", message: quiz.getScore(), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.quiz.reset()
            self.setupQuestions()
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
}

