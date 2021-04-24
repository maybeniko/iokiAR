//
//  CLLocationCoordinate2D+Extensions.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 26.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

extension CLLocationCoordinate2D {
    
    //distance in meters, as explained in CLLoactionDistance definition
    func distance(from: CLLocationCoordinate2D) -> CLLocationDistance {
        let destination=CLLocation(latitude:from.latitude,longitude:from.longitude)
        return CLLocation(latitude: latitude, longitude: longitude).distance(from: destination)
    }
}

