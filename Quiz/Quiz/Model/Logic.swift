//
//  Logic.swift
//  Quiz
//
//  Created by Kevin Torres on 13/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation

struct Logic {
    private var questions = [
        Question(text: "Sound travels faster through water than air.", answer: "True"),
        Question(text: "An electron carries a positive charge.", answer: "False"),
        Question(text: "There are more than 200 bones in the human body.", answer: "True"),
        Question(text: "A magnet has 2 poles: north and south.", answer: "True"),
        Question(text: "Water consists of two parts oxygen and one part hydrogen.", answer: "False"),
        Question(text: "Conductors have low resistance.", answer: "True"),
        Question(text: "Venus is the closest planet to the Sun.", answer: "False"),
        Question(text: "The study of plants is known as botany.", answer: "True"),
        Question(text: "Electrons are larger than molecules.", answer: "False"),
        Question(text: "Sharks are mammals.", answer: "False"),
        Question(text: "Chewing gum takes seven years for a person to digest.", answer: "False"),
        Question(text: "If a piece of paper was folded 45 times, it would reach to the moon.", answer: "True"),
        Question(text: "Atomic bombs work by atomic fission.", answer: "True"),
    ]
    
    private var questionIndex = 0
    private var gameEnded = false
    private var rightAns = 0
    
    mutating func checkAnswer(answer userAnswer: String) -> Bool {
        if userAnswer == questions[questionIndex].answer {
            rightAns += 1
            return true
        }
        return false
    }
    
    mutating func checkIndex() -> Bool {
        if questionIndex + 1 < QuestionsCount {
            QuestionIndex += 1
            return true
        }
        return false
    }
    
    mutating func checkIfEnded() -> Bool {
        if questionIndex == QuestionsCount-1 && !gameEnded {
            gameEnded = true
            return true
        }
        return false
    }
    
    mutating func ResetGame() {
        questionIndex = 0
        rightAns = 0
        gameEnded = false
        ShuffleQuestions()
    }
    
    mutating func ShuffleQuestions() {
        questions.shuffle()
    }
    
    var QuestionIndex: Int {
        get { return questionIndex }
        set { questionIndex = newValue }
    }
    
    var QuestionsCount: Int {
        get { return questions.count }
    }
    
    var CurrentQuestion: String {
        return questions[questionIndex].text
    }
    
    var RightAns: Int {
        get { return rightAns }
        set { rightAns = newValue }
    }
}
