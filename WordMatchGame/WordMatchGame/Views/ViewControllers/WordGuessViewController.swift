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
    @IBOutlet weak var timerLabel: UILabel!
    
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
    
    // MARK: - Properties
    var baseWord: String = ""
    
    var timer: Timer = Timer()
    
    // MARK: - LifeCycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        firstLetterTextField.delegate = self
        secondLetterTextField.delegate = self
        thirdLetterTextField.delegate = self
        fourthLetterTextField.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        if firstLetterImageView.image == UIImage(systemName: "checkmark.circle.fill") && secondLetterImageView.image == UIImage(systemName: "checkmark.circle.fill") && thirdLetterImageView.image == UIImage(systemName: "checkmark.circle.fill") && fourthLetterImageView.image == UIImage(systemName: "checkmark.circle.fill") {
            doneButton.backgroundColor = .red
            
            navigationController?.popViewController(animated: true)
        }
        // Else, perhaps present an AlertController saying that we have words that are not correct.
    }
    
    
    // MARK: - Methods
    
    func updateViews() {
        baseWordTextField.text = baseWord
        doneButton.backgroundColor = .lightGray
        self.view.backgroundColor = .customDarkPurple
    }
}

extension WordGuessViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let baseWordArray = Array(self.baseWord.lowercased())
        
        if textField == firstLetterTextField {
            
            guard let firstWordText = self.firstLetterTextField.text, !firstWordText.isEmpty else { return }
            let firstWordArray = Array(firstWordText.lowercased())
            
            if baseWordArray[0] == firstWordArray[0] {
                firstLetterImageView.image = UIImage(systemName: "checkmark.circle.fill")
            } else {
                firstLetterImageView.image = UIImage(systemName: "xmark.octagon.fill")
            }
        }
        else if textField == secondLetterTextField {
            
            guard let secondWordText = self.secondLetterTextField.text, !secondWordText.isEmpty else { return }
            let secondWordArray = Array(secondWordText.lowercased())
            
            if baseWordArray[1] == secondWordArray[1] {
                secondLetterImageView.image = UIImage(systemName: "checkmark.circle.fill")
            } else {
                secondLetterImageView.image = UIImage(systemName: "xmark.octagon.fill")
            }
        }
        else if textField == thirdLetterTextField {
            
            guard let thirdWordText = self.thirdLetterTextField.text, !thirdWordText.isEmpty else { return }
            let thirdWordArray = Array(thirdWordText.lowercased())
            
            if baseWordArray[2] == thirdWordArray[2] {
                thirdLetterImageView.image = UIImage(systemName: "checkmark.circle.fill")
            } else {
                thirdLetterImageView.image = UIImage(systemName: "xmark.octagon.fill")
            }
        } else {
            
            guard let fourthWordText = self.fourthLetterTextField.text, !fourthWordText.isEmpty else { return }
            let fourthWordArray = Array(fourthWordText.lowercased())
            
            if baseWordArray[3] == fourthWordArray[3] {
                fourthLetterImageView.image = UIImage(systemName: "checkmark.circle.fill")
            } else {
                fourthLetterImageView.image = UIImage(systemName: "xmark.octagon.fill")
            }
        }
    }
}
