//
//  ViewController.swift
//  Messenger
//
//  Created by Kevin Torres on 21/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Kevin Chat 📬"
        
        // Animating without CLTypingLabel
//        titleLabel.text = ""
//        var charIndex = 1.0
//        let titleText = "Kevin Chat 📬"
//        for letter in titleText {
//            Timer.scheduledTimer(withTimeInterval: 0.1*charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
    }
}

