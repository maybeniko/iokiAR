//
//  Station.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 03.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import CoreLocation

public struct ARLocation {
    
    let locationAvatar: UIImage
    let location: CLLocation
    let pinStyle: ARStyle
    let pinText: String
    let type: Type
    
    public init(locationAvatar: UIImage, location: CLLocation, pinStyle: ARStyle, pinText: String, type: Type) {
        self.locationAvatar = locationAvatar
        self.location = location
        self.pinStyle = pinStyle
        self.pinText = pinText
        self.type = type
    }
    
    public enum `Type`: String {
        case station, vehicle
    }
}


