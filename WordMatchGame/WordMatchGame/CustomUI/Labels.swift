//
//  Labels.swift
//  WordMatchGame
//
//  Created by Colton Swapp on 8/26/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class Labels: UILabel {

    override func awakeFromNib() {
        <#code#>
    }
    
    func updateFontTo(font: String) {
        let size = self.font.pointSize
        self.font = UIFont(name: font, size: size)
    }

}
