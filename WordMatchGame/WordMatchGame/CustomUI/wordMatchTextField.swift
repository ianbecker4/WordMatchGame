//
//  wordMatchTextField.swift
//  WordMatchGame
//
//  Created by Todd Crandall on 8/27/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class wordMatchTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }
    
    func updateFontTo(fontName: String) {
        guard let size = self.font?.pointSize else { return }
        self.font = UIFont(name: fontName, size: size)
    }
    
    func updatePlaceHolder() {

        let currentPlaceHolderText = self.placeholder
        self.attributedPlaceholder = NSAttributedString(string: currentPlaceHolderText ?? "", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont(name: FontNames.helveticaBold, size: 0)!
        ])
    }
    
    func setUpUI() {
        self.backgroundColor = .customPink
        self.addCornerRadius()
        self.layer.masksToBounds = true
        self.textColor = .white
        self.updateFontTo(fontName: FontNames.helveticaBold)
        self.updatePlaceHolder()
    }
}//End of Class
