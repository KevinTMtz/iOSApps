//
//  ViewController.swift
//  Quiz
//
//  Created by Kevin Torres on 13/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    var logic = Logic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logic.ShuffleQuestions()
        updateGUI()
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        sender.alpha = 0.75
        // Change button color
        if logic.checkAnswer(answer: sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Chage button color back to normal
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            UIView.animate(withDuration: 0.25) {
                sender.backgroundColor = UIColor.secondarySystemGroupedBackground
                sender.alpha = 1.0
            }
        }
        
        // Show restart option if completed
        if logic.checkIfEnded() {
            questionLabel.text = "Right answers:\n\(logic.RightAns) of \(logic.QuestionsCount)"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.progressBar.progress = 1.0
                self.trueButton.isHidden = true
                self.falseButton.isHidden = true
                self.restartButton.isHidden = false
            }
        }
        
        // Check if should update GUI
        if logic.checkIndex() {
            updateGUI()
        }
    }
    
    @IBAction func restartQuiz(_ sender: UIButton) {
        resetGame()
    }
    
    // Update question and progress bar
    func updateGUI() {
        questionLabel.text = logic.CurrentQuestion
        progressBar.progress = Float(logic.QuestionIndex)/Float(logic.QuestionsCount)
    }
    
    // Restart the quiz & all properties
    func resetGame() {
        logic.ResetGame()
        
        progressBar.progress = 0.0
        trueButton.isHidden = false
        falseButton.isHidden = false
        restartButton.isHidden = true
        
        updateGUI()
    }
}

