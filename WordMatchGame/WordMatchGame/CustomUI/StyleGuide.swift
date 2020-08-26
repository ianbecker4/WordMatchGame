//
//  StyleGuide.swift
//  WordMatchGame
//
//  Created by Todd Crandall on 8/26/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

extension UIView {
    
    func addCornerRadius(_ radius: CGFloat = 4) {
        self.layer.cornerRadius = radius
    }
}//End of Extension

struct FontNames {
    
    static let helveticaBold = "Helvetica-Bold"
}//End of Struct

extension UIColor {
    
    static let customDarkPurple = UIColor(named: "customDarkPurple")!
    static let customGreen = UIColor(named: "customGreen")
    static let customPink = UIColor(named: "customPink")
    static let customPurple = UIColor(named: "customPurple")
}//End of Extension
