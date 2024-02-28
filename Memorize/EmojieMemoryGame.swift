//
//  EmojieMemoryGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/6/24.
//

import Foundation
import SwiftUI

class EmojieMemoryGame: ObservableObject {
    @Published private var model: MemorizeGame<String>
    let theme: ThemeGame
    init(color: Color?, difficulty: Difficulty?) {
        self.theme = ThemeGame(color: color, difficulty: difficulty)
        self.model = EmojieMemoryGame.createMemoryGame(theme.context, theme.numberOfPair)
    }

    private static func createMemoryGame(_ context: [String], _ numberOfPair: Int) -> MemorizeGame<String> {
        
        return MemorizeGame<String>(numberOfPair) {
            index in
            context[index]
        }
    }
    var color: Color{
        
        return theme.color
    }
    var cards: [MemorizeGame<String>.Card] {
        return model.cards
    }

    var score: Int {
        return model.score
    }

    func choose(card: MemorizeGame<String>.Card) {
        model.choose(card)
    }

    func shuffle() {
        model.shuffle()
    }

    func reset() {}
}
