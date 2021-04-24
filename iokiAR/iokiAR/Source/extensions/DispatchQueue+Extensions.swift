//
//  DispatchQueue+Extensions.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 26.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit

extension DispatchQueue {
    
    func asyncAfter(timeInterval: TimeInterval, execute: @escaping () -> Void) {
        
        self.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(timeInterval * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: execute)
    }
}
