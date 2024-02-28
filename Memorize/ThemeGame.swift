//
//  ThemeGame.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/17/24.
//

import Foundation
import SwiftUI

struct ThemeGame {
    var _color: Color
    
    var color: Color{
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
    
    init(color: Color?, difficulty: Difficulty?) {
        self._color = ThemeGame.obtainColor(color: color)
        self._context = ThemeGame.obtainContext(color: self._color)
        self._numberOfPair = ThemeGame.obtainNumberOfPair(difficulty: difficulty)
    }

    static func obtainNumberOfPair(difficulty: Difficulty?) -> Int {
        if let actuallyDifficulty = difficulty {
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
            let randomPair = [4, 8, 12]
            return randomPair.shuffled()[0]
        }
    }

    static func obtainContext(color: Color) -> [String] {
        switch color {
        case .orange:
            return ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"].shuffled()
        case .red:
            return ["🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵"].shuffled()
        case .blue:
            return ["⚽️", "🏀", "🎾", "🏐", "🏈", "🥏", "⚾️", "🏓", "🏸", "🥅", "🥋", "🥊", "🥍", "⛳️"].shuffled()
        default:
            return ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"].shuffled()
        }
    }

    static func obtainColor(color: Color?) -> Color {
        if let actuallyColor = color {
            return actuallyColor
        }
        else {
            let randomArray: [Color] = [.orange, .red, .blue]
            let select = randomArray.shuffled()[0]
            return select
        }
    }
}
