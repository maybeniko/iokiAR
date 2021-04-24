//
//  UIImageView+Extensions.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 05.05.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) 
        self.layer.masksToBounds = true
    }
}
