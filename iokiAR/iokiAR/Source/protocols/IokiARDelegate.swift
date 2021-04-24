//
//  ARDelegate.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 03.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import MapKit

public protocol IokiARDelegate: class {
    func getARLocations() -> [ARLocation]
    func getARRoute() -> [ARRoute]
    func getDriverDetails() -> [ARDriverDetails]
}

