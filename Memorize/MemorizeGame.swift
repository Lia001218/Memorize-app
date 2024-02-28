//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/6/24.
//

import Foundation

struct MemorizeGame<CardContext> where CardContext: Equatable {
    private(set) var cards: [Card]
    var score: Int = 0
    init(_ numberOfPair: Int, cardContextFactory: (Int) -> CardContext) {
        cards = []
        for index in 0 ..< max(2, numberOfPair) {
            let context = cardContextFactory(index)
            cards.append(Card(id: "\(index)a", context: context))
            cards.append(Card(id: "\(index)b", context: context))
        }
    }

    var indexOfFaceUpCard: Int? {
        get {
            let faceUpIndices = cards.indices.filter { index in cards[index].isFaceUp }
            return faceUpIndices.count == 1 ? faceUpIndices.first : nil
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) }
        }
    }

    mutating func choose(_ card: Card) {
        if let choose_index = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[choose_index].isFaceUp && !cards[choose_index].isMatch {
                if let potencialIndexMatch = indexOfFaceUpCard {
                    if cards[choose_index].context == cards[potencialIndexMatch].context {
                        cards[choose_index].isMatch = true
                        cards[potencialIndexMatch].isMatch = true
                        self.score = self.score + 10
                    }
                } else {
                    indexOfFaceUpCard = choose_index
                }
                cards[choose_index].isFaceUp = true
            }
        }
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Equatable, Identifiable {
        var id: String

        var isFaceUp: Bool = false
        var isMatch: Bool = false
        let context: CardContext
    }
}
