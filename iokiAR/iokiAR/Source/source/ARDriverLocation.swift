//
//  ARDriverLocation.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 11.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import CoreLocation

public struct ARDriverLocation {
    let location: CLLocation
    
    init(location: CLLocation) {
        self.location = location
    }
}
