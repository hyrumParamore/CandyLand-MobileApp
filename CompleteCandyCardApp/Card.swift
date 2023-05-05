//
//  Card.swift
//  CompleteCandyCardApp
//
//  Created by Hyrum Paramore on 5/2/23.
//

import Foundation

// Struct that creates the random cards.
struct Card {
    let name: String
    let number: Int
    let numberOfAssetCards: Int = 18
    
//  Initializes the card and then returns it as an object.
    init() {
            name = "Card"
            number = Int.random(in: 1...numberOfAssetCards)
        }
    var cardName: String {
            return name + String(number)
        }
}
