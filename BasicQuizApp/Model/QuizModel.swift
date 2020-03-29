//
//  QuizModel.swift
//  BasicQuizApp
//
//  Created by Ankur Rajput on 29/03/20.
//  Copyright © 2020 Ankur Rajput. All rights reserved.
//

import Foundation
import UIKit

struct QuizQuestion {
    var correctAnswer: Bool
    var question: String
    var image: UIImage
}

class QuizModel {
    private var questions: [QuizQuestion] = [
        QuizQuestion(correctAnswer: true, question: "Is this a tree?", image: UIImage(named: "tree")!),
        QuizQuestion(correctAnswer: false, question: "Is this a dog?", image: UIImage(named: "car")!),
        QuizQuestion(correctAnswer: false, question: "Is this a person?", image: UIImage(named: "mug")!)
    ]
    private var score: Int = 0
    private var questionIndex: Int = 0
    
    func getScore() -> String {
        return "\(score) \\ \(questions.count)"
    }
    
    func getQuestion() -> QuizQuestion {
        return questions[questionIndex]
    }
    
    func check(answer: Bool) -> Bool {
        let question = getQuestion()
        if question.correctAnswer == answer {
            score += 1
            return true
        }
        return false
    }
    
    func nextQuestion() -> Bool {
        questionIndex += 1
        if questionIndex > questions.count - 1 {
            return false
        }
        return true
    }
    
    func reset() {
        questionIndex = 0
        score = 0
    }
    
}
