//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/6/24.
//

import Foundation

struct MemorizeGame<CardContext> where CardContext: Equatable{
    
    private (set) var cards : Array<Card>
    init(numberOfPair : Int, cardContextFactory : (Int) -> CardContext ){
        cards = []
        
        for index in 0..<max(2, numberOfPair){
            let context = cardContextFactory(index)
            cards.append(Card(id: "\(index)a",context: context))
            cards.append(Card(id: "\(index)b",context: context))
        }
    }
    func choose(_ card : Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle() 
    }
    struct Card: Equatable, Identifiable{
        var id: String
        
        var isFaceUp: Bool = true
        var isMatch : Bool = false
        let context : CardContext

    }
}

