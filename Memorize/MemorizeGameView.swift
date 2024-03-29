//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Lia Zerquera on 11/13/23.
//

import SwiftUI

struct MemorizeGameView: View {
    @ObservedObject var viewModel: EmojieMemoryGame
 
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Memorize!")
                    Spacer()
                    Text(String(viewModel.score))
//                    NavigationLink(destination: NewGameView(viewModel: EmojieMemoryGame())) {
//                        Text("New Game")
//                    }
                }

                ScrollView {
                    
                    cards
                        .animation(.default, value: viewModel.cards)
                }
                Button("Shuffle") {
                    viewModel.shuffle()
                }
            }
            .font(.largeTitle)
            .padding()
            .foregroundColor(viewModel.color)
        }
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) {
                card in CardView(card: card)
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
            }
        }
    }
}

struct CardView: View {
    let card: MemorizeGame<String>.Card

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.context)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)

            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatch ? 1 : 0)
    }
}

#Preview {
    MemorizeGameView(viewModel: EmojieMemoryGame(color: nil, difficulty: nil))
}
