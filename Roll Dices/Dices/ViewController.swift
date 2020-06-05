//
//  ViewController.swift
//  Dices
//
//  Created by Kevin Torres on 05/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up dice images at load
        updateImageViewDice()
    }

    // ImageView elements
    @IBOutlet weak var diceImgView_1: UIImageView!
    @IBOutlet weak var diceImgView_2: UIImageView!
    
    @IBAction func rollDices(_ sender: Any) {
        updateImageViewDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateImageViewDice()
    }
    
    func updateImageViewDice () {
        // Change image of the imageView
        diceImgView_1.image = UIImage(named: "dice\(Int.random(in: 1 ... 6))")
        diceImgView_2.image = UIImage(named: "dice\(Int.random(in: 1 ... 6))")
    }
}
