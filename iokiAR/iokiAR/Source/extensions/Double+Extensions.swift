//
//  Double+Extensions.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 26.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit

extension Double {
    
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
        formatter.unitsStyle = style
        guard let formattedString = formatter.string(from: self) else { return "" }
        
        return formattedString
    }
    
    var distanceToString:String {
        return String(format: "%.2fm", self)
    }
}

