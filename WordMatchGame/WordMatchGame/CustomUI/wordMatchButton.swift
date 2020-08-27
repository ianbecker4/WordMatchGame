//
//  wordMatchButton.swift
//  WordMatchGame
//
//  Created by Todd Crandall on 8/27/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class wordMatchButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpViews()
    }
    
    func setUpViews() {
        self.backgroundColor = .customDarkPurple
        self.setTitleColor(.white, for: .normal)
        updateFontTo(font: FontNames.helveticaBold)
        addCornerRadius()
    }
    
    func updateFontTo(font: String) {
        guard let size = self.titleLabel?.font.pointSize else { return }
        self.titleLabel?.font = UIFont(name: font, size: size)
    }
}//End of Class
