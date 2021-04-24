//
//  SceneManager.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 04.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import CoreLocation

struct StationManager {
    
    let station: [Station]
    
    func buildStationData() -> [LocationAnnotationNode]{
        
        var nodes: [LocationAnnotationNode] = []
        
        for station in station {
        
        let stationPin = buildViewNode(latitude: station.location.latitude, longitude: station.location.longitude, altitude: station.altitude, text: station.pinText, color: station.pinColor)
        
        nodes.append(stationPin)
            
        }
        
        return nodes
        
    }
    
    func buildViewNode(latitude: CLLocationDegrees, longitude: CLLocationDegrees, altitude: CLLocationDistance, text: String, color: UIColor) -> LocationAnnotationNode {
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location =  CLLocation(coordinate: coordinate, altitude: altitude)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = text
        let font = UIFont(name: "CircularStd-Medium", size: 18.0)
        label.font = font
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.backgroundColor = color
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return LocationAnnotationNode(location: location, view: label)
        
    }
    
    
}
