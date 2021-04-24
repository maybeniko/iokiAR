//
//  FloatingPoint+Extensions.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 26.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit

extension FloatingPoint {
    func toRadians() -> Self {
        return self * .pi / 180
    }
    
    func toDegrees() -> Self {
        return self * 180 / .pi
    }
}
