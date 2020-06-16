//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Kevin Torres on 15/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var result: String?
    var tip: String?
    var color: UIColor?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 15
        
        resultLabel.text = result
        tipLabel.text = tip
        view.backgroundColor = color
    }
    
    @IBAction func donePress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
