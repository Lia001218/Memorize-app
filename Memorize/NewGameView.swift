//
//  NewGameView.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/7/24.
//

import SwiftUI

struct NewGameView: View {
         var body: some View {
                  VStack {
                           HStack {
                                    Text("New Game")
                                             .font(.largeTitle)
                                             .foregroundColor(.orange)
                                             .padding()
                                    Image(systemName: "gamecontroller")
                                             .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                
                           }.padding(.top)
            
                           HStack {
                                    VStack {
                                             HStack {
                                                      Text("Difficulty")
                                                               .font(.title)
                                                               .padding()
                                                      Spacer()
                                                      Text("Theme")
                                                               .font(.title)
                                                               .padding(.vertical)
                                                      Spacer()
                                             }
											 
                                             HStack {
                                                      DifficultyButtons()
                                                     
                                                      Spacer()
															   
                                                      ThemeButtons()
                                             }
                                             Spacer()
                                    }.padding()
                                    Spacer()
                           }
						   Spacer()
						   HStack{
									Spacer()
									Button("Done"){
											 print("some")
									}.padding()
											 .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
						   }
                  }
         }
}

struct DifficultyButtons: View {
         var body: some View {
                  VStack {
                           Button(
                                    action: {
                                             print("Hello")
                                    }) {
                                             Image(systemName: "circle.fill")
                                                      .frame(width: 25)
					
                                             Text("Easy")
                                             Spacer()
                                    }
                                    .padding()
                           Button(action: {
                                    print("Hello")
                           }) {
                                    Image(systemName: "circle.fill")
                                             .frame(width: 25)
		 
                                    Text("Medium")
                                    Spacer()
                           }.padding()
						   
                           Button(action: {
                                    print("Hello")
                           }) {
                                    Image(systemName: "circle.fill")
                                             .frame(width: 25)
					
                                    Text("Hard")
                                    Spacer()
                           }.padding()
                           Spacer()
                  }
                  .font(.title)
         }
}

struct ThemeButtons: View {
         var body: some View {
                  VStack {
                           Button(
                                    action: {
                                             print("Hello")
                                    }) {
                                             Image(systemName: "car.circle")
                                                      .frame(width: 25)
					
                                             Text("Cars")
                                             Spacer()
                                    }
                                    .padding()
                           Button(action: {
                                    print("Hello")
                           }) {
                                    Image(systemName: "smiley")
                                             .frame(width: 25)
		 
                                    Text("Emojis")
                                    Spacer()
                           }.padding()
						   
                           Button(action: {
                                    print("Hello")
                           }) {
                                    Image(systemName: "soccerball.circle")
                                             .frame(width: 25)
					
                                    Text("Sports")
                                    Spacer()
                           }.padding()
                           Spacer()
                  }.font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
         }
}

#Preview {
         NewGameView()
}
