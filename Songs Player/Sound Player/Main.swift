//
//  Main.swift
//  Sound Player
//
//  Created by Kevin Torres on 5/27/19.
//  Copyright © 2019 Kevin Torres. All rights reserved.
//

import UIKit
import MediaPlayer

class Main: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func genrebuttonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        playGenre(genre: sender.currentTitle!)
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
