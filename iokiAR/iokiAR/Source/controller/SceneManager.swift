//
//  SceneManager.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 04.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

// responsible for build either a ViewNode or ImageNode
public struct SceneManager {
    
    private weak var delegate: IokiARDelegate?
    
    init(delegate: IokiARDelegate) {
        self.delegate = delegate
    }
    
    public func buildStationData(stations: [ARLocation], currentLocation: CLLocation) -> [LocationAnnotationNode] {
        
        var nodes: [LocationAnnotationNode] = []
        var locationNode: LocationAnnotationNode
        
        for station in stations {
            switch station.type {
            case .station:
                locationNode = buildImageNode(station: station)
            case .vehicle:
                locationNode = buildViewNode(station: station, currentLocation: currentLocation)
            }
            nodes.append(locationNode)
        }
        return nodes
    }
    
    private func buildImageNode(station: ARLocation) -> LocationAnnotationNode {
        
        let image = UIImage(named: "logo")!
        return LocationAnnotationNode(location: station.location, image: image)
    }
    
    private func buildViewNode(station: ARLocation, currentLocation: CLLocation) -> LocationAnnotationNode {
        
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 310, height: 85))
        
        customView.distanceLabel.text = String(currentLocation.distance(from: station.location).rounded())  + "m"
        customView.avatarImageView.image = station.locationAvatar
        customView.locationLabel.text = String(station.pinText)
        
        return LocationAnnotationNode(location: station.location,  view: customView, cornerRadius: station.pinStyle.roundedCorners)
    }
    
}
