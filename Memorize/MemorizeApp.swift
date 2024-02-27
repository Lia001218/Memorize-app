//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Lia Zerquera on 11/13/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojieMemoryGame(color: nil, difficulty: nil)
    
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(viewModel: game)
        }
    }
}
