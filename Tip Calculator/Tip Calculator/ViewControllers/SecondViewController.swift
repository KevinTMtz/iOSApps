//
//  SecondViewController.swift
//  Tip Calculator
//
//  Created by Kevin Torres on 16/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var totalPerPerson: String = ""
    var people: String = ""
    var tip: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 15
        
        resultLabel.text = "$\(totalPerPerson)"
        descriptionLabel.text = "Split between \(people) people, with \(tip)% tip."
    }
    
    @IBAction func donePress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
