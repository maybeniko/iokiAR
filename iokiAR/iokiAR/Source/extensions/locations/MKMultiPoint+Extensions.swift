//
//  MKMultiPoint+Extensions.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 26.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import MapKit

public extension MKMultiPoint {
    
    var coordinates: [CLLocationCoordinate2D] {
        
        var coords = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid,
                                              count: pointCount)
        
        getCoordinates(&coords, range: NSRange(location: 0, length: pointCount))
        
        return coords
    }
}

