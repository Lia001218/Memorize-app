//
//  EmojieMemoryGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/6/24.
//

import Foundation

class EmojieMemoryGame: ObservableObject {
    @Published private var model: MemorizeGame<String>
    init(color: String?, difficulty: Difficulty?) {
        self.model = EmojieMemoryGame.createMemoryGame(color: color, difficulty: difficulty)
    }

    private static func createMemoryGame(color: String?, difficulty: Difficulty?) -> MemorizeGame<String> {
        let theme = ThemeGame(color: color, difficulty: difficulty)
        return MemorizeGame<String>(theme.numberOfPair) {
            index in
            theme.context[index]
        }
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
