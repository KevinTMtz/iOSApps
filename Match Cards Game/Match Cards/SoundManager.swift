//
//  SoundManager.swift
//  Match Cards
//
//  Created by Kevin Torres on 7/11/19.
//  Copyright © 2019 Kevin Torres. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    static var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
        case youloose
        case youwin
    }
    
    static func playSound(_ effect:SoundEffect) {
        var soundFilename = ""
        
        // Determine which sound effect to play
        switch effect {
            case .flip:
                soundFilename = "cardflip"
            case .shuffle:
                soundFilename = "shuffle"
            case .match:
                soundFilename = "dingcorrect"
            case .nomatch:
                soundFilename = "dingwrong"
            case .youloose:
                soundFilename = "youloose"
            case .youwin:
                soundFilename = "youwin"
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find soun file \(soundFilename) in the bundle")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
        } catch {
            // Couldn't create the audio player object, log the error
            print("Couldn't create the audio player object for sound file \(soundFilename)")
        }
    }
}
