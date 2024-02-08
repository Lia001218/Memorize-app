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
                                                      VStack {
															   Text("Difficulty")
																		.font(.title)
																		.padding()
                                                               Button(
                                                                        action: {
                                                                                 print("Hello")
                                                                        }) {
                                                                                 Image(systemName: "circle.fill")
														
                                                                                 Text("Easy")
                                                                        }
																		.padding()
                                                               Button(action: {
                                                                        print("Hello")
                                                               }) {
                                                                        Image(systemName: "circle.fill")
											 
                                                                        Text("Medium")
															   }.padding()
															   
                                                               Button(action: {
                                                                        print("Hello")
                                                               }) {
                                                                        Image(systemName: "circle.fill")
														
                                                                        Text("Hard")
                                                               }
                                                               Spacer()
                                                      }
                                                      .font(.title)
													  Spacer()
															   
													  VStack {
															   Text("Theme")
																		.font(.title)
																		.padding()
															   Button(
																		action: {
																				 print("Hello")
																		}) {
																				 Image(systemName: "car.circle")
														
																				 Text("Cars")
																		}
																		.padding()
															   Button(action: {
																		print("Hello")
															   }) {
																		Image(systemName: "smiley")
											 
																		Text("Emojis")
															   }.padding()
															   
									  
															   Button(action: {
																		print("Hello")
															   }) {
																		Image(systemName: "soccerball.circle")
														
																		Text("Sports")
															   }
															   Spacer()
													  }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                             }
                                             Spacer()
                                    }.padding(.horizontal)
                                    Spacer()
                           }
                  }
         }
}

#Preview {
         NewGameView()
}
