//
//  EmojieMemoryGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/6/24.
//

import Foundation

class EmojieMemoryGame: ObservableObject {
    private var numberOfPair: Int
    var difficulty: String = "Easy"
    var theme: String = "Emojie"
    init() {
        if difficulty == "Easy"{
            numberOfPair = 3
        }else if difficulty == "Medium"{
            numberOfPair = 8
        }else {
            numberOfPair = 15
        }
        
    }
    private static var emojie: [String] = ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
    private static var cars: [String] = ["🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵", "🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵", "🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵"]
    private static var sport: [String] = ["⚽️", "🏀", "🎾", "🏐", "🏈", "🥏", "⚾️", "🏓", "🏸", "🥅", "🥋", "🥊", "🥍", "⛳️"]
    
    private static func createMemoryGame(numberOfPair: Int?) -> MemorizeGame<String> {
        let number: Int  = (numberOfPair != nil) ? numberOfPair! : 3
            
        
        return MemorizeGame<String>(numberOfPair: number) {
            index in
            if emojie.indices.contains(index) {
                return emojie[index]
            }
            else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame(numberOfPair: nil)

    var cards: [MemorizeGame<String>.Card] {
        return model.cards
    }
    
    func choose(card: MemorizeGame<String>.Card) {
        model.choose(card)
    }

    func shuffle() {
        model.shuffle()
    }

    func reset() {
        EmojieMemoryGame.emojie.shuffle()
        
        model = EmojieMemoryGame.createMemoryGame(numberOfPair: self.numberOfPair)
    }
}
