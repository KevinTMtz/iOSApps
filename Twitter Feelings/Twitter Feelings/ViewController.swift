//
//  ViewController.swift
//  Twitter Feelings
//
//  Created by Kevin Torres on 25/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var feelingsLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let numTotalTweets = 100
    
    let sentimentClassifier = TweetFeelingsClassifier()
    
    // Replace with your Twitter keys
    let swifter = Swifter(consumerKey: "TWITTER_CONSUMER_KEY", consumerSecret: "TWITTER_CONSUMER_SECRET")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func predictPressed(_ sender: UIButton) {
        fetchTweets()
    }
    
    func fetchTweets() {
        if let searchText = textField.text {
            swifter.searchTweet(using: searchText, lang: "en", count: numTotalTweets, tweetMode: .extended, success: { (results, metadata) in
                var tweets = [TweetFeelingsClassifierInput]()
                
                for i in 0..<self.numTotalTweets {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = TweetFeelingsClassifierInput(text: tweet)
                        tweets.append(tweetForClassification)
                    }
                }
                
                self.makePrediction(with: tweets)
                
            }) { (error) in
                print("Error with the API request: \(error)")
            }
        }
    }
    
    func makePrediction(with tweets: [TweetFeelingsClassifierInput]) {
        do {
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            
            var sentimentScore = 0;
            
            for prediction in predictions {
                if prediction.label == "Pos" {
                    sentimentScore += 1
                } else if prediction.label == "Neg" {
                    sentimentScore -= 1
                }
            }
            
            updateUIFeelingsLabel(score: sentimentScore)
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    func updateUIFeelingsLabel(score sentimentScore: Int) {
        if sentimentScore > 25 {
            self.feelingsLabel.text = "😄"
        } else if sentimentScore > 0 {
            self.feelingsLabel.text = "🙂"
        } else if sentimentScore < -25 {
            self.feelingsLabel.text = "☹️"
        } else if sentimentScore < 0 {
            self.feelingsLabel.text = "🙁"
        } else {
            self.feelingsLabel.text = "😐"
        }
    }
}
