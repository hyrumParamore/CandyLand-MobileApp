//
//  Card.swift
//  CompleteCandyCardApp
//
//  Created by Hyrum Paramore on 5/2/23.
//

import Foundation

struct Card {
//    let prompt: String
    let name: String
    let number: Int
    let numberOfAssetCards: Int = 18
    
    init() {
//            numberOfAssetCards = 18
            name = "Card"
            number = Int.random(in: 1...numberOfAssetCards)
        }
    var cardName: String {
            return name + String(number)
        }

}



