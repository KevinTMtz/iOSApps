//
//  ViewController.swift
//  Twitter Feelings
//
//  Created by Kevin Torres on 25/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {

    @IBOutlet weak var feelingsLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // Replace with your Twitter keys
    let swifter = Swifter(consumerKey: "TWITTER_CONSUMER_KEY", consumerSecret: "TWITTER_CONSUMER_SECRET")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            print(results)
        }) { (error) in
            print("Error with the API request: \(error)")
        }
    }

    @IBAction func predictPressed(_ sender: UIButton) {
    
    }
}

