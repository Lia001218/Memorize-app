//
//  ContentView.swift
//  Memorize
//
//  Created by Lia Zerquera on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojies: [String] = ["😆", "😍", "🤩", "😆", "😍", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"]
    @State var countCard: Int = .random(in: 2 ... 6)
    @State var theme = "face"
    var body: some View {
        VStack {
            Text("Memorize!")
            
//            ScrollView{
//            Spacer()
            cards
//            }
               
            Spacer()
            HStack {
                addMinusButton
                Spacer()
                facesThemeButton
                Spacer()
                carsThemeButton
                Spacer()
                sportsThemeButton
                Spacer()
                addPlusButton
            }.imageScale(.large)
                .foregroundColor(.blue)
        }
        .font(.largeTitle)
        .padding()
        .foregroundColor(color)
    }
    
    var color: Color {
        if theme == "face" {
            return .orange
        }
        else if theme == "cars" {
            return .red
        }
        else {
            return .indigo
        }
    }
    let estimatedCardHeight: CGFloat = 120
    var cards: some View {
        GeometryReader { geometry  in
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], content: {
                ForEach(0 ..< countCard, id: \.self) {
                    index in CardView(emojie: emojies[index], theme: theme).aspectRatio(2/3, contentMode: .fit
                    )
//                        .frame(width: min(geometry.size.width / CGFloat(countCard), 120), height: nil)
                }
                
            })
        }
    }

//    var gridwidthrectangle: CGFloat{
//        let screen = UIScreen.main.bounds.size.width
//        return
//    }
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        var gridW: CGFloat = 85
        let screenWidth = UIScreen.main.bounds.size.width - 50
        let spacing: CGFloat = 1
        let availableWidth = screenWidth - spacing - gridW
      
        let column = availableWidth / gridW
        let calculatedWidth = (availableWidth - (column - 1) * spacing) / column
       
        return min(calculatedWidth, gridW)
    }


    func createButton(count: Int, action_name: String) -> some View {
        Button(action: {
            countCard += count
        }, label: {
            Image(systemName: action_name)
            
        })
    }

    var carsThemeButton: some View {
        Button(action: {
                   emojies = ["🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵","🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵","🚗", "🏎️", "🛻", "🚕", "🚓", "🚚", "🚙", "🚑", "🚛", "🚌", "🚒", "🚎", "🚐", "🚔", "🚍", "🚘", "🚖", "🛵"].shuffled()
                   theme = "cars"
                   countCard = Int.random(in: 1 ... 6)
            
               },
               label: {
                   VStack {
                       Image(systemName: "car")
                       Text("Cars").font(.headline)
                   }
            
               })
    }

    var sportsThemeButton: some View {
        Button(action: {
                   emojies = ["⚽️", "🏀", "🎾", "🏐", "🏈", "🥏", "⚾️", "🏓", "🏸", "🥅", "🥋", "🥊", "🥍", "⛳️"].shuffled()
                   theme = "sport"
                   countCard = Int.random(in: 1 ... 6)
            
               },
               label: {
                   VStack {
                       Image(systemName: "baseball")
                       Text("Sports").font(.headline)
                   }
            
               })
    }

    var facesThemeButton: some View {
        Button(action: {
                   emojies = ["😆", "😍", "🤩", "😆", "🤩", "😃", "😅", "🥲", "🙃", "🙂", "😉", "😌"].shuffled()
                   theme = "face"
                   countCard = Int.random(in: 1 ... 6)
            
               },
               label: {
                   VStack {
                       Image(systemName: "face.dashed")
                       Text("face").font(.headline)
                   }
            
               })
    }

    var addPlusButton: some View {
        return createButton(count: +1, action_name: "rectangle.stack.fill.badge.plus").disabled(countCard >= emojies.count)
    }

    var addMinusButton: some View {
        return createButton(count: -1, action_name: "rectangle.stack.fill.badge.minus").disabled(countCard == 1)
    }
}

struct CardView: View {
    let emojie: String
    @State var faceUp: Bool = false
    let theme: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:  12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(emojie).font(.largeTitle)
            }.opacity(faceUp ? 1 : 0)
            base.fill()
                .opacity(faceUp ? 0 : 1)
        
        }.onTapGesture {
            faceUp.toggle()
        }
    }
}
    
#Preview {
    ContentView()
}
