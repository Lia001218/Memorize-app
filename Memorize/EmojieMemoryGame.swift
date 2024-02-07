//
//  EmojieMemoryGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/6/24.
//

import Foundation


class EmojieMemoryGame : ObservableObject{
    private static let emojie: [String] =  ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
    private static let cars : [String] = ["🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵","🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵","🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵"]
    private static let sport : [String] = ["⚽️", "🏀", "🎾", "🏐", "🏈", "🥏", "⚾️", "🏓", "🏸", "🥅", "🥋", "🥊", "🥍", "⛳️"]
    
    private static func createMemoryGame() -> MemorizeGame<String> {
        return   MemorizeGame<String>(numberOfPair : 3){
            index in
            if emojie.indices.contains(index){
                return emojie[index]
            }
            else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()

    
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    func choose(card :MemorizeGame<String>.Card){
        model.choose(card)
        
    }
    func shuffle(){
        model.shuffle()

    }
}
