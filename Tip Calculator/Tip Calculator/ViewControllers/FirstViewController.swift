//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kevin Torres on 16/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var totalTextField: UITextField!
    
    @IBOutlet weak var tipFirst: UIButton!
    @IBOutlet weak var tipSecond: UIButton!
    @IBOutlet weak var tipThird: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButton.layer.cornerRadius = 15
        splitStepper.layer.cornerRadius = 8
        
        totalTextField.inputAccessoryView = toolBar()
        
        self.totalTextField.delegate = self
    }
    
    // Accept just one decimal point
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let arrayOfString = newString.components(separatedBy: ".")

        if arrayOfString.count > 2 {
            return false
        }
        return true
    }
    
    @IBAction func tipPressed(_ sender: UIButton) {
        tipFirst.isSelected = false
        tipSecond.isSelected = false
        tipThird.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let splitValue = sender.value
        splitLabel.text = String(Int(splitValue))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = totalTextField.text!
        var tipPercentage = 0.2
        if (tipFirst.isSelected) {
            tipPercentage = 0.0
        } else if (tipSecond.isSelected) {
            tipPercentage = 0.1
        }
        let peopleToSplit = splitStepper.value
        
        calculatorBrain.calculateTip(totalBillString: totalBill, tipPercentage: tipPercentage, peopleToSplit: peopleToSplit)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.totalPerPerson = calculatorBrain.getTotalPerPerson()
            destinationVC.people = calculatorBrain.getPeopleToSplit()
            destinationVC.tip = calculatorBrain.getTip()
        }
    }
}
