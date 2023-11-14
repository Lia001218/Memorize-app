//
//  ContentView.swift
//  Memorize
//
//  Created by Lia Zerquera on 11/13/23.
//

import SwiftUI

struct ContentView: View {
var emojies: [String] = ["😆","😍","🌊", "🤩","😆","😍","🌊", "🤩"]
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
            ForEach(0..<emojies.count){
                index in CardView(emojie: emojies[index])
            }
            
        })
        
    }
}

struct CardView: View {
    let emojie: String
    @State var faceUp: Bool = false
    var body: some View {
        ZStack{
            if faceUp{
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                    .border(Color.orange)
            }
            else{
                RoundedRectangle(cornerRadius: 12.0).foregroundColor(.orange)
            }
           
            Text(emojie).font(.largeTitle).opacity(faceUp ? 1: 0 )
        }
        .onTapGesture {
            faceUp.toggle()
        }
    }
}
#Preview {
    ContentView()
}
