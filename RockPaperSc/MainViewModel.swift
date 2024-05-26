//
//  MainViewModel.swift
//  RockPaperSc
//
//  Created by Руслан on 26.05.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    var gestureArray = ["rock","paper","scissors"]
    @Published var userChoose = "paper"
    @Published var chooser = Bool.random()
    @Published var compChoose = "rock"
    var textForCentre: String { chooser ? "WIN" : "LOSE"}
    @Published var count = 0
    var rounds = 0
    var gameOver = false
    var newGame = true
    @Published var loaded = false
    
    
    func getRandom () {
        gestureArray.shuffle()
        chooser = Bool.random()
        compChoose = gestureArray.randomElement() ?? "rock"
    }
    func gameLogic () {
        rounds += 1
        var winner = false
        var optionalWinner = false
        switch (userChoose, compChoose) {
        case ("paper", "scissors") : winner = false
        case ("paper", "paper") : winner = false
        case ("paper", "rock") : winner = true
        case ("scissors" , "scissors" ) : winner = false
        case ("scissors", "paper") : winner = true
        case ("scissors", "rock") : winner = false
        case ("rock", "paper") : winner = false
        case ("rock" , "scissors") : winner = true
        case ("rock","rock") : winner = false
        default : winner = true
        }
        optionalWinner = chooser ? winner : !winner
        if optionalWinner  { count += 1 }
        getRandom()
        if rounds == 10 {gameOver.toggle() } 
        
    }
    func changeUserChoose(_ name: String) {
        userChoose = name
    }
    func newGameFunc() {
        getRandom()
        rounds = 0
        count = 0
        gameOver = false
        newGame = false
        
        
    }
    
    
}
