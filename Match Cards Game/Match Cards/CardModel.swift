//
//  CardModel.swift
//  Match Cards
//
//  Created by Kevin Torres on 7/8/19.
//  Copyright © 2019 Kevin Torres. All rights reserved.
//

import Foundation

class CardModel {
    func getCards() -> [Card] {
        // Numbers of the numbers already generated
        var generatedNumbersArray = [Int]()
        
        // The generated cards
        var generatedCardsArray = [Card]()
        
        while generatedNumbersArray.count < 8 {
            // arc4random_uniform(13) to get random number from 0 to 12
            let randomNumber = arc4random_uniform(13) + 1
            
            // Ensure that we do not already have this number
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                generatedNumbersArray.append(Int(randomNumber))
                
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardOne)
                
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardTwo)
                
                // Log number: print(randomNumber)
            }
            
            // TODO: TODO is to see something in the top bar
        }
        
        // Randomize the array
        generatedCardsArray.shuffle()
        
        return generatedCardsArray
    }
}
