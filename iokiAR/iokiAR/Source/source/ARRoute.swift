//
//  ARRoute.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 17.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import CoreLocation

public struct ARRoute {
    
    let coordinates: [CLLocationCoordinate2D]
    
    public init(coordinates: [CLLocationCoordinate2D]) {
        self.coordinates = coordinates
    }
}
