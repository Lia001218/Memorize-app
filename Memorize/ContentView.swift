//
//  ContentView.swift
//  Memorize
//
//  Created by Lia Zerquera on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    var emojies: [String] = ["😆","😍","🌊", "🤩","😆","😍","🌊", "🤩"]
    @State var countCard: Int = 4
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            HStack{
                addMinusButton
                Spacer()
                addPlusButton
            }
        }
        .font(.largeTitle)
        .padding()
        
        
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
            ForEach(0..<countCard, id: \.self){
                index in CardView(emojie: emojies[index])
            }
            
        })
    }
    func createButton(count: Int, action_name: String) -> some View{
        Button(action:{
            countCard += count
        }, label: {
            Image(systemName: action_name)
            
        }).imageScale(.large)
        
    }
    var addPlusButton: some View{
        return createButton(count: +1, action_name:"rectangle.stack.fill.badge.plus" ).disabled(countCard >= emojies.count)
    }
    var addMinusButton: some View{
    
        return createButton(count: -1, action_name: "rectangle.stack.fill.badge.minus").disabled(countCard == 1)
    }
}

struct CardView: View {
    let emojie: String
    @State var faceUp: Bool = false
    var body: some View {
        ZStack{
            if faceUp{
                RoundedRectangle(cornerRadius: 25).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25).strokeBorder(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
            else{
                RoundedRectangle(cornerRadius: 25.0)
            }
           
            Text(emojie).font(.largeTitle).opacity(faceUp ? 1: 0 )
        }
        .padding(0.0)
        .frame(width: 150.0, height: 200.0)
        .foregroundColor(.orange)
        .onTapGesture {
            faceUp.toggle()
        }
    }
}
    
#Preview {
    ContentView()
}
