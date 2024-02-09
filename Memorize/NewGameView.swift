//
//  NewGameView.swift
//  Memorize
//
//  Created by Lia Zerquera on 2/7/24.
//

import SwiftUI

struct NewGameView: View {
		 @ObservedObject var viewModel: EmojieMemoryGame
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
                                                      VStack {
                                                               Button(
                                                                        action: {
																				 viewModel.difficulty = "Easy"
                                                                        }) {
                                                                                 Image(systemName: "circle.fill")
                                                                                          .frame(width: 25)
														
                                                                                 Text("Easy")
                                                                                 Spacer()
                                                                        }
                                                                        .padding()
                                                               Button(action: {
																		viewModel.difficulty = "Medium"
                                                               }) {
                                                                        Image(systemName: "circle.fill")
                                                                                 .frame(width: 25)
											 
                                                                        Text("Medium")
                                                                        Spacer()
                                                               }.padding()
															   
                                                               Button(action: {
																		viewModel.difficulty = "Hard"
                                                               }) {
                                                                        Image(systemName: "circle.fill")
                                                                                 .frame(width: 25)
														
                                                                        Text("Hard")
                                                                        Spacer()
                                                               }.padding()
                                                               Spacer()
                                                      }
                                                      .font(.title)
                                                      Spacer()
															   
                                                      VStack {
                                                               Button(
                                                                        action: {
																				 viewModel.theme = "Cars"
                                                                        }) {
                                                                                 Image(systemName: "car.circle")
                                                                                          .frame(width: 25)
														
                                                                                 Text("Cars")
                                                                                 Spacer()
                                                                        }
                                                                        .padding()
                                                               Button(action: {
																		viewModel.theme = "Emojie"
                                                               }) {
                                                                        Image(systemName: "smiley")
                                                                                 .frame(width: 25)
											 
                                                                        Text("Emojis")
                                                                        Spacer()
                                                               }.padding()
															   
                                                               Button(action: {
																		viewModel.theme = "Sports"
                                                               }) {
                                                                        Image(systemName: "soccerball.circle")
                                                                                 .frame(width: 25)
														
                                                                        Text("Sports")
                                                                        Spacer()
                                                               }.padding()
                                                               Spacer()
                                                      }.font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                                             }
                                             Spacer()
                                    }.padding()
                                    Spacer()
                           }
						   Spacer()
						   NavigationView(content: {
									
									NavigationLink(destination: MemorizeGameView(viewModel: EmojieMemoryGame())) {
											 Spacer()
										Text("Done")
													  .padding()
													  .font(.largeTitle)
									}
						   
						   })
                  }
				  
         }
}



#Preview {
         NewGameView(viewModel: EmojieMemoryGame())
}
