//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kevin Torres on 16/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButton.layer.cornerRadius = 5
    }


}

