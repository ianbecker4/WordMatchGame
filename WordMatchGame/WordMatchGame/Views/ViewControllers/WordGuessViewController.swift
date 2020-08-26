//
//  WordGuessViewController.swift
//  WordMatchGame
//
//  Created by Colton Swapp on 8/26/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class WordGuessViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var baseWordTextField: UITextField!
    @IBOutlet weak var firstLetterTextField: UITextField!
    @IBOutlet weak var secondLetterTextField: UITextField!
    @IBOutlet weak var thirdLetterTextField: UITextField!
    @IBOutlet weak var fourthLetterTextField: UITextField!
    
    @IBOutlet weak var firstLetterImageView: UIImageView!
    @IBOutlet weak var secondLetterImageView: UIImageView!
    @IBOutlet weak var thirdLetterImageView: UIImageView!
    @IBOutlet weak var fourthLetterImageView: UIImageView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Methods
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
