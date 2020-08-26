//
//  WordsArrayController.swift
//  WordMatchGame
//
//  Created by Ian Becker on 8/26/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import Foundation

class WordsArrayController {
    
    static let shared = WordsArrayController()
    
    static let arrayOfWords: WordsArray = {
        let words = WordsArray(words: ["Farm", "Oven", "Tree", "Fish", "Cart", "Port", "Rock", "Jump", "Bear", "Fork", "Bowl", "Wolf", "Lake", "Lava", "Hide", "Dark", "Moon", "Star", "Type", "Milk", "Iron", "Goat", "Blue", "Desk", "Plug", "Sock", "High", "Fort", "Baby", "Fall", "Nest", "Card", "Bush", "Pink", "Fire", "Deer", "Trip", "Sand", "Nail", "Yarn", "Tent", "Pail", "Cure", "Dirt", "Cord", "Wood", "Mesh", "Snow", "Salt", "Boat", "Land", "Ball", "Word", "Bolt", "Case", "Trap", "Claw", "Fang", "Hair", "Tire", "Bold", "Clay"])
        
        return words
    }()
    
    func generateRandomWordFrom(wordsArray: [String]) -> String {
        guard let randomWord = wordsArray.randomElement() else { return "" }
        return randomWord
    }
}
