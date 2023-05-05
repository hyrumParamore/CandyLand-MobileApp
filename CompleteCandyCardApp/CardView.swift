//
//  CardView.swift
//  CompleteCandyCardApp
//
//  Created by Hyrum Paramore on 5/2/23.
//


import SwiftUI

struct CardView: View {
    let card: Card
    var removal: (() -> Void)? = nil

    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white
                )
                .shadow(radius: 10, x: 0, y: 10)

            VStack {
                Image(card.cardName)
            }
            .multilineTextAlignment(.center)
            }
//           Basic outline of this animation for the card from Hacking With Swift - Paul Hudson
            .frame(width: 300, height: 450)
            .rotationEffect(.degrees(Double(offset.width / 5)))
            .offset(x: offset.width * 3, y: 0)
            .opacity(2 - Double(abs(offset.width / 50)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
//                  If the card moves a certain distance, it will remove the card, else reset it back.
                    .onEnded { _ in
                        if abs(offset.width) > 50 {
                            removal?()
                            
                        } else {
                            offset = .zero
                        }
                    }
                )
        }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card:  Card())
        
    }
}
