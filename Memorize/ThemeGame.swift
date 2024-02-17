//
//  ThemeGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/17/24.
//

import Foundation

struct ThemeGame {
    var color: String
    var context: [String]
    var numberOfPair: Int
    init() {
        var randomArray = [1, 2, 3]
        var select = randomArray.shuffled()[0]
        var randomPair = [4, 8, 12]
        self.numberOfPair = randomPair.shuffled()[0]
        switch select {
        case 1:
            self.color = "orange"
            self.context = ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
        case 2:
            self.color = "red"
            self.context = ["🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵"]
        case 3:
            self.color = "blue"
            self.context = ["⚽️", "🏀", "🎾", "🏐", "🏈", "🥏", "⚾️", "🏓", "🏸", "🥅", "🥋", "🥊", "🥍", "⛳️"]
        default:
            self.color = "orange"
            self.context = ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
        }
    }
    
    init(color: String, difficulty: Difficulty) {
        self.color = color
        switch color {
        case "orange":
            self.context = ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
        case "red":
            self.context = ["🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵"]
        case "blue":
            self.context = ["⚽️", "🏀", "🎾", "🏐", "🏈", "🥏", "⚾️", "🏓", "🏸", "🥅", "🥋", "🥊", "🥍", "⛳️"]
        default:
            self.context = ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
        }
        switch difficulty {
        case .Easy:
            self.numberOfPair = 4
        case .Medium:
            self.numberOfPair = 8
        case .Hard:
            self.numberOfPair = 12
        }
    }
}
