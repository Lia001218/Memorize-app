//
//  ThemeGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/17/24.
//

import Foundation

struct ThemeGame {
    var _color: String
    
    var color: String{
        get{
           return  _color
        }
    }
    var _context: [String]
    var context: [String]{
        get{
            _context
        }
    }
    var _numberOfPair: Int
    var numberOfPair: Int{
        get{
            _numberOfPair
        }
    }
    
    init(color: String?, difficulty: Difficulty?) {
        self._color = ThemeGame.obtainColor(color: color)
        self._context = ThemeGame.obtainContext(color: self._color)
        self._numberOfPair = ThemeGame.obtainNumberOfPair(difficulty: difficulty)
    }

    static func obtainNumberOfPair(difficulty: Difficulty?) -> Int {
        if var actuallyDifficulty = difficulty {
            switch actuallyDifficulty {
            case .Easy:
                return 4
            case .Medium:
                return 8
            case .Hard:
                return 12
            }
        }
        else {
            var randomPair = [4, 8, 12]
            return randomPair.shuffled()[0]
        }
    }

    static func obtainContext(color: String) -> [String] {
        switch color {
        case "orange":
            return ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
        case "red":
            return ["🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵"]
        case "blue":
            return ["⚽️", "🏀", "🎾", "🏐", "🏈", "🥏", "⚾️", "🏓", "🏸", "🥅", "🥋", "🥊", "🥍", "⛳️"]
        default:
            return ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
        }
    }

    static func obtainColor(color: String?) -> String {
        if var actuallyColor = color {
            return actuallyColor
        }
        else {
            var randomArray = ["orange", "red", "blue"]
            var select = randomArray.shuffled()[0]
            return select
        }
    }
}
