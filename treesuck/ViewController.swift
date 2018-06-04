//
//  ViewController.swift
//  2.11 - Apple Pie
//
//  Created by The Duke on 5/26/18.
//  Copyright © 2018 The Duke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["kelly", "duke", "jennifer", "derrick", "alex", "andrew", "monkey", "caroline", "amanda", "benjamin", "adeline", "georgia", "william", "ryan", "katelyn", "girl", "robert", "patricia", "judy", "jim", "jena", "chase", "lily", "sophie", "bunny", "boomer", "blue", "abby"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        } // end didSet
    } // end totalWins
    
    var totalLosses = 0 {
        didSet {
            newRound()
        } // end didSet
    } // end totalLosses
    
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        sender.backgroundColor = .lightGray
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    } // end buttonPressed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    } // end viewDidLoad()
    
    var currentGame: Game!
    
    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } // end if
        else {
            enableLetterButtons(false)
        } // end else
    } // end newRound()
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
            button.backgroundColor = .white
        } // end for
    } // end enableLetterButtons()
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        } // end for
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    } // end updateUI()
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } // end if
        else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } // end else if
        else {
            updateUI()
        } // end else
    } // end updateGameState()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // end didReceiveMemoryWarning()
    
    
} // end class ViewController

