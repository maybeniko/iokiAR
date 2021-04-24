//
//  iokiAR.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 03.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import Foundation
import UIKit


// interface between App and Framework
public struct iokiAR {
    
    public static func createViewController(delegate: IokiARDelegate) -> UIViewController & DataAvailability{
        return AugmentedViewController(delegate: delegate)
    }

}
