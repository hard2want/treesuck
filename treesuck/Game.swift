//
//  Game.swift
//  2.11 - Apple Pie
//
//  Created by The Duke on 5/26/18.
//  Copyright © 2018 The Duke. All rights reserved.
//




import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        } // end if
    } // end playerGuessed()
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            } // end if
            else {
                guessedWord += "_"
            } // end else
        } // end for
        return guessedWord
    } // end formattedWord
    
    
    
} // end struct Game


