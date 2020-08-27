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
    
    var timer = Timer()
    
    var secondsRemaining = 30
    
    // MARK: - LifeCycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
        startTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        firstLetterTextField.delegate = self
        secondLetterTextField.delegate = self
        thirdLetterTextField.delegate = self
        fourthLetterTextField.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        if firstLetterImageView.image == UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
            && secondLetterImageView.image == UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
            && thirdLetterImageView.image == UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
            && fourthLetterImageView.image == UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal) {
            
            self.alertUserOfSuccess()
        }
    }
    
    
    // MARK: - Methods
    func redDoneButton() {
        if firstLetterImageView.image == UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
        && secondLetterImageView.image == UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
        && thirdLetterImageView.image == UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
            && fourthLetterImageView.image == UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal) {
            
            self.doneButton.backgroundColor = .red
        }
    }
    func alertUserOfSuccess() {
        
        let alertController = UIAlertController(title: "You Win!", message: "You should feel proud of your vocabulary!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "I do feel proud, thanks!", style: .default) { (_) in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func alertUserOfLoss() {
        let alertController = UIAlertController(title: "You're pitiful...", message: "That really wasn't that hard...what's the matter with you?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "You're right... :(", style: .default) { (_) in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining >= 0 {
                self.timerLabel.text = self.timeFormatted(self.secondsRemaining)
                self.redDoneButton()
                self.secondsRemaining -= 1
            }
            else {
                Timer.invalidate()
                self.alertUserOfLoss()
            }
            print("\(self.secondsRemaining)")
        }
    }
    
    func timeFormatted(_ secondsRemianing: Int) -> String {
        let seconds: Int = secondsRemaining % 60
        return String(format: "0:%02d", seconds)
    }
    
    func updateViews() {
        baseWordTextField.text = baseWord.uppercased()
        doneButton.backgroundColor = .lightGray
        self.view.backgroundColor = .customDarkPurple
        
        timerLabel.text = timeFormatted(secondsRemaining)
    }
}

extension WordGuessViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let baseWordArray = Array(self.baseWord.lowercased())
        
        if textField == firstLetterTextField {
            
            guard let firstWordText = self.firstLetterTextField.text, !firstWordText.isEmpty else { return }
            let firstWordArray = Array(firstWordText.lowercased())
            
            if baseWordArray[0] == firstWordArray[0] {
                firstLetterImageView.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
            } else {
                firstLetterImageView.image = UIImage(systemName: "xmark.octagon.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            }
        }
        else if textField == secondLetterTextField {
            
            guard let secondWordText = self.secondLetterTextField.text, !secondWordText.isEmpty else { return }
            let secondWordArray = Array(secondWordText.lowercased())
            
            if baseWordArray[1] == secondWordArray[1] {
                secondLetterImageView.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
            } else {
                secondLetterImageView.image = UIImage(systemName: "xmark.octagon.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            }
        }
        else if textField == thirdLetterTextField {
            
            guard let thirdWordText = self.thirdLetterTextField.text, !thirdWordText.isEmpty else { return }
            let thirdWordArray = Array(thirdWordText.lowercased())
            
            if baseWordArray[2] == thirdWordArray[2] {
                thirdLetterImageView.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
            } else {
                thirdLetterImageView.image = UIImage(systemName: "xmark.octagon.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            }
        } else {
            
            guard let fourthWordText = self.fourthLetterTextField.text, !fourthWordText.isEmpty else { return }
            let fourthWordArray = Array(fourthWordText.lowercased())
            
            if baseWordArray[3] == fourthWordArray[3] {
                fourthLetterImageView.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor(red: 123/255, green: 224/255, blue: 173/255, alpha: 1), renderingMode: .alwaysOriginal)
            } else {
                fourthLetterImageView.image = UIImage(systemName: "xmark.octagon.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            }
        }
    }
}//End of Class

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
