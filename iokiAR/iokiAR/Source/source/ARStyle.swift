//
//  ARStyle.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 09.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit

public struct ARStyle {
    
    let textColor: UIColor
    let bgColor: UIColor
    let textFont: UIFont
    let roundedCorners: CGFloat
    
    public init(textColor: UIColor, bgColor: UIColor, textFont: UIFont, roundedCorners: CGFloat) {
        self.textColor = textColor
        self.bgColor = bgColor
        self.textFont = textFont
        self.roundedCorners = roundedCorners
    }
}
