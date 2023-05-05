//
//  Deck.swift
//  CompleteCandyCardApp
//
//  Created by Hyrum Paramore on 5/2/23.
//

import Foundation

// Creates a deck that holds all of the Cards and stores it into an array to
// allow for easier use later.
struct Deck {
    var cards: [Card] = []
    var numOfCards: Int
    
    init() {
        numOfCards = 30
        for _ in 1...numOfCards {
            cards.append(Card())
        }
    }
}
