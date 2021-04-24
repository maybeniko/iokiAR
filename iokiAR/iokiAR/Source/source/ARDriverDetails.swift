//
//  ARDriver.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 23.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

public struct ARDriverDetails {
    
    let location: CLLocationCoordinate2D
    
    public init(location: CLLocationCoordinate2D) {
        self.location = location
    }
}
