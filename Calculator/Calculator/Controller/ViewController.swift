//
//  ViewController.swift
//  Calculator
//
//  Created by Kevin Torres on 17/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedtypingNum: Bool = true
    private var calculator = CalculatorLogic()
    
    private var displayDoubleValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Could not convert text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculationButtonPressed(_ sender: UIButton) {
        isFinishedtypingNum = true
        
        calculator.setNumber(displayDoubleValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayDoubleValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let buttonText = sender.currentTitle {
            if isFinishedtypingNum {
                if buttonText == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = buttonText
                }
                
                isFinishedtypingNum = false
            } else {
                if let labelText = displayLabel.text {
                    if buttonText == "." && (labelText.contains(".")) {
                        return
                    }
                    
                    displayLabel.text = labelText + buttonText
                }
            }
        }
    }
}
