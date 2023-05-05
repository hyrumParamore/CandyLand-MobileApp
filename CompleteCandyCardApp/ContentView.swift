//
//  ContentView.swift
//  CompleteCandyCardApp
//
//  Created by Hyrum Paramore on 5/2/23.
//

import SwiftUI

// Basic outline of this function from Hacking With Swift - Paul Hudson
// This allows the cards to be stacked at a slight offset to look like
// a real deck of cards.
extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 4)
    }
}

// Basic outline of this struct from Hacking With Swift - Paul Hudson
// Creates the button style and allowes easier use.
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 20.0)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .scaleEffect(configuration.isPressed ? 1.4 : 1)
            .animation(.easeOut(duration: 1.5), value: configuration.isPressed)
    }
}

// Creates the content view where everything is placed.
struct ContentView: View {

    @State private var deck = Deck()

    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            Button(action: {
                deck.cards.removeAll()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    addCards()
                }
            }) {
                Text("Shuffle")
                    
            }
            .buttonStyle(GrowingButton())
            .opacity(deck.cards.count == 0 ? 1 : 0)
            
            VStack {
                
                ZStack {
                    // Basic outline of this from Hacking With Swift - Paul Hudson 
                    ForEach(0..<deck.cards.count, id: \.self) {index in
                        CardView(card: deck.cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: deck.cards.count)
                    }
                }
            }
        }
    }
//  Remmoves a card from the deck when one is swiped away.
    func removeCard(at index: Int) {
        deck.cards.remove(at: index)
    }
//  Adds a new deck of cards when you run out.
    func addCards() {
        for _ in 1...deck.numOfCards {
            deck.cards.append(Card())
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
