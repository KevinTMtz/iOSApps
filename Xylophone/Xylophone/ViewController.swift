//
//  ViewController.swift
//  Xylophone
//
//  Created by Kevin Torres on 06/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressedKey(_ sender: UIButton) {
        playSound(note: sender.tag)
        
        sender.alpha = 0.75

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            UIView.animate(withDuration: 0.15) {
                sender.alpha = 1.0
            }
        }
    }
    
    func playSound(note: Int) {
        let soundURL = Bundle.main.url(forResource: "note\(note)", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        
        audioPlayer.play()
    }
    
}

