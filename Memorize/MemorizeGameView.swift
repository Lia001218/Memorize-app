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
        VStack {
            
            Text("Memorize!")
            
            ScrollView{
                //            Spacer()
                cards
                    .animation(.default, value: viewModel.cards)
                
            }
            Button("Shuffle"){
                viewModel.shuffle()
                
            }
                          
        }
        .font(.largeTitle)
        .padding()
        .foregroundColor(.orange)
    }

    let estimatedCardHeight: CGFloat = 120
    var cards: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0 ) ], spacing: 0){
                ForEach(viewModel.cards) {
                    card in CardView( card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                
            }
        }
                
    }
        
}

struct CardView: View {

    let  card : MemorizeGame<String>.Card

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:  12)
            Group{
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
        
    }
}
    
#Preview {
    MemorizeGameView(viewModel: EmojieMemoryGame())
}
