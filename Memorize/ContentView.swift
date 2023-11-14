//
//  ContentView.swift
//  Memorize
//
//  Created by Lia Zerquera on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LazyHStack{
            CardView(emojie: "😁")
            CardView(emojie: "☺️")
            
        }
        
        
    }
}

struct CardView: View {
    let emojie: String
    @State var faceUp: Bool = false
    var body: some View {
        ZStack{
            Rectangle()
            
                .fill()
                .foregroundColor(.orange)

            Text(emojie)
        }
    }
}
#Preview {
    ContentView()
}
