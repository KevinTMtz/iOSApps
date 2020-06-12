//
//  ViewController.swift
//  Egg-Timer
//
//  Created by Kevin Torres on 11/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    let eggTimes = ["Soft": 10, "Medium": 20, "Hard": 30]
    var secondsRemaining: Float = 60.0
    var secondsRemainingTotal: Float = 60.0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var labelTime: UILabel!
    
    @IBAction func buttonPress(_ sender: UIButton) {
        timer.invalidate()
        titleLabel.text = "Egg Timer"
        progressBar.progress = 0.0
        
        let selectedButtonName = sender.currentTitle!
        
        secondsRemaining = Float(eggTimes[selectedButtonName]!)
        secondsRemainingTotal = secondsRemaining
        
        labelTime.text = "\(secondsRemaining)s"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 1 {
            secondsRemaining -= 1
            progressBar.progress = (secondsRemainingTotal-secondsRemaining)/secondsRemainingTotal
            labelTime.text = "\(secondsRemaining)s"
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            labelTime.text = "0.0s"
            titleLabel.text = "Done!"
        }
    }
    
}

