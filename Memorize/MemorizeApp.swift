//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Lia Zerquera on 11/13/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojieMemoryGame(numberOfPair: 3)
    
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(viewModel: game)
        }
    }
}
