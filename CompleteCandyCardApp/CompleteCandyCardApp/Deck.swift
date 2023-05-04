//
//  Deck.swift
//  CompleteCandyCardApp
//
//  Created by Hyrum Paramore on 5/2/23.
//

import Foundation

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
