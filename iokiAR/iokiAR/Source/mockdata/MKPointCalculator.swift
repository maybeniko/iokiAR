//
//  MKPointCalculator.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 26.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import Foundation



// draw augmented route based on the given array of CLLocationCoordinate2D
//    func drawARRoute() {
//
//        //        let route = self.delegate?.getARRoute() ?? []
//
//        let destinationLocation = CLLocationCoordinate2D(latitude: 50.118000, longitude: 8.672460)
//
//        let sourcePlacemark = MKPlacemark(coordinate: sceneLocationView.sceneLocationManager.currentLocation!.coordinate, addressDictionary: nil)
//        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
//
//        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
//        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
//
//        let sourceAnnotation = MKPointAnnotation()
//
//        if let location = sourcePlacemark.location {
//            sourceAnnotation.coordinate = location.coordinate
//        }
//
//        let destinationAnnotation = MKPointAnnotation()
//
//        if let location = destinationPlacemark.location {
//            destinationAnnotation.coordinate = location.coordinate
//        }
//
//
//        let directionRequest = MKDirections.Request()
//        directionRequest.source = sourceMapItem
//        directionRequest.destination = destinationMapItem
//        directionRequest.transportType = .walking
//
//        // Calculate the direction
//        let directions = MKDirections(request: directionRequest)
//
//        directions.calculate {
//            (response, error) -> Void in
//
//            guard let response = response else {
//                if let error = error {
//                    print("Error: \(error)")
//                }
//
//                return
//            }
//
//            let route = response.routes
//
//            let finalRoute = response.routes[0]
//
//            let points = finalRoute.polyline.coordinates
//
//            print(points)
//
//        }
//
//    }
//
////            for index in 0..<(points.count-1) {
////                let currentLoc = CLLocation(latitude: points[index].latitude, longitude: points[index].longitude)
////                let nextLoc = CLLocation(latitude: points[index + 1].latitude, longitude: points[index + 1].longitude)
////
////                if currentLoc.distance(from: nextLoc) < 5 {
////                    print(currentLoc)
////                }
////            }
//
//        }
//
//
//    }
