//
//  ContentView.swift
//  RockPaperSc
//
//  Created by Руслан on 26.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        VStack {
            if !viewModel.newGame {
                Image(viewModel.compChoose)
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("points : \(viewModel.count)")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding()
                    .background(.black)
                    .clipShape(.capsule)
            }
            if viewModel.newGame {
                ZStack {
                    Text("Rock, Paper, Scissors")
                        .foregroundStyle(.white)
                        .font(.system(size: 50))
                        .padding()
                        .offset(x: viewModel.loaded ? 0: -250)
                }.background(.black)
                    .clipShape(.capsule)
                    .onAppear{
                        viewModel.loaded.toggle()
                    }
            }
            ZStack{
                Circle()
                    .foregroundStyle(!viewModel.chooser ? .red : .green)
                    .shadow(radius: 10)
                if viewModel.newGame {
                    Button{
                        viewModel.newGameFunc()
                    } label: {
                        Text("New Game")
//                            .font(.largeTitle)
                            .opacity(viewModel.loaded ? 1 : 0.3)
                            .fontWeight(.heavy)
                            .font(.system(size: viewModel.loaded ? 60 : 100))
                            .foregroundStyle(.white)
                            .shadow(radius: 20)
                    }
                } else {
                    Text(viewModel.textForCentre)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
            }
            //buttons
            if !viewModel.newGame {
                HStack {
                    
                    // button 1
                    Button{
                        viewModel.changeUserChoose(viewModel.gestureArray[0])
                        viewModel.gameLogic()
                    } label: {
                        ImageElement(imageName: viewModel.gestureArray[0])
                    }
                    // button 1
                    Button{
                        viewModel.changeUserChoose(viewModel.gestureArray[1])
                        viewModel.gameLogic()
                    } label: {
                        ImageElement(imageName: viewModel.gestureArray[1])
                    }
                    .offset(y: 20)
                    // button 1
                    Button{
                        viewModel.changeUserChoose(viewModel.gestureArray[2])
                        viewModel.gameLogic()
                    } label: {
                        ImageElement(imageName: viewModel.gestureArray[2])
                    }
                }
                .frame(width: 300, height: 200)
            }
        }
        
        .alert("Game over!", isPresented: $viewModel.gameOver) {
                    Button("Wanna play one more?", role: .cancel) {
                        viewModel.newGameFunc()
                    }
                } message: {
                    Text("Your score is: \(viewModel.count)")
                }
                .background{ if viewModel.chooser {
                    Image("background").colorInvert()
                } else {
                    Image("background")
                }
                    
                }
                
                .blur(radius: viewModel.gameOver ? 30 : 0)
        .padding()
        .animation(.easeInOut, value: viewModel.gameOver)
        .animation(.easeInOut, value: viewModel.newGame)
        .animation(.bouncy.speed(0.8), value: viewModel.loaded)
    }
}

#Preview {
    MainView()
}
