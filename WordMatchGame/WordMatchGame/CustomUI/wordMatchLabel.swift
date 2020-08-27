//
//  wordMatchLabel.swift
//  WordMatchGame
//
//  Created by Todd Crandall on 8/27/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class wordMatchLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpViews()
    }
    
    func setUpViews() {
        self.backgroundColor = .customDarkPurple
        self.textColor = .white
        self.addCornerRadius()
    }
}//End of Class
