//
//  InitialViewController.swift
//  WordMatchGame
//
//  Created by Colton Swapp on 8/26/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var secondsRemaining = 30
    
    let arrayOfWords: [String?] = ["Farm", "Oven", "Tree", "Fish", "Cart", "Port", "Rock", "Jump", "Bear", "Fork", "Bowl", "Wolf", "Lake", "Lava", "Hide", "Dark", "Moon", "Star", "Type", "Milk", "Iron", "Goat", "Blue", "Desk", "Plug", "Sock", "High", "Fort", "Baby", "Fall", "Nest", "Card", "Bush", "Pink", "Fire", "Deer", "Trip", "Sand", "Nail", "Yarn", "Tent", "Pail", "Cure", "Dirt", "Cord", "Wood", "Mesh", "Snow", "Salt", "Boat", "Land", "Ball", "Word", "Bolt", "Case", "Trap", "Claw", "Fang", "Hair", "Tire", "Bold", "Clay", "Gray", "Play", "Heat", "Pond", "Frog", "Moss", "Sage", "Game", "View", "Code", "Bump", "Song", "True", "Silk", "Gold", "Road", "Path", "Gate", "Hike", "Bark", "Bird", "Book", "Line", "Band", "Bass", "Rope", "Pole", "Meat", "Drum", "Calf", "Time", "Vial", "Foot", "Gear", "Date", "West", "Boar", "Pass", "Hand", "Swim", "Mark", "Next", "Done", "Well", "Bolt", "Nail", "Peak", "Name", "Bell", "Nose", "Pull", "Team", "Read", "Head", "Gulp", "Plus", "Gear", "Desk", "Twig", "Mars", "Flip", "Base", "Find", "Orca", "Hawk", "Dime", "Pick", "Sail", "Ring", "Cave", "Fear", "Rose", "Look", "Term", "Mode", "Lift", "Ship", "Talk", "Leaf", "Walk", "Camp", "File", "Hour", "Tube", "Dive", "Fuel", "Food", "Page", "Safe", "Draw", "Roll", "Plug", "Hill", "Wrap", "Cake", "Lamp", "Rain", "Hail", "Wind", "Tent"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    func generateRandomWordFrom(wordsArray: [String?]) -> String? {
        guard let randomWord = wordsArray.randomElement() else { return "" }
        return randomWord
    }
    
    // MARK: - Actions
    @IBAction func generateWordButtonTapped(_ sender: UIButton) {
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWordGuessVC",
            let destinationVC = segue.destination as? WordGuessViewController {
            let randomWord = generateRandomWordFrom(wordsArray: arrayOfWords)
            destinationVC.baseWord = randomWord ?? ""
            //            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (Timer) in
            //                if self.secondsRemaining > 0 {
            //                    self.secondsRemaining -= 1
            //                }
            //                else {
            //                    Timer.invalidate()
            //                }
            //            }
            //            destinationVC.timer = secondsRemaining
        }
    }
}
