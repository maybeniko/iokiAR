//
//  UpdateDistance.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 10.05.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import Foundation


//        updateUserLocationTimer = Timer.scheduledTimer(timeInterval: 2,
//                                                       target: self,
//                                                       selector: #selector(self.updateDistanceLabel),
//                                                       userInfo: nil,
//                                                       repeats: true)

//    @objc func updateDistanceLabel() {
//
//        buildData().forEach { data in
//
//            let distance = data.annotationNode.locNode!.distance(from: sceneLocationView.sceneLocationManager.currentLocation!.coordinate).rounded()
//
//            if  distance < 10 {
//                data.annotationNode.view?.distanceLabel.textColor = #colorLiteral(red: 0.2352941176, green: 1, blue: 0.3333333333, alpha: 1)
//                data.annotationNode.view?.distanceLabel.text = "You are almost there!"
//            }
//
//        }
//
//    }
//



//        @objc
//        func updatePinDistance() {
//
//            let driverDet = delegate?.getDriverDetails() ?? []
//            for driver in driverDet {
//                let location = CLLocation(latitude: driver.location.latitude, longitude: driver.location.longitude)
//                self.distance = Float(driver.location.distance(from: userLocation.coordinate))
//                self.modelNode.position = self.translateNode(location)
//                self.modelNode.scale = self.scaleNode(location)
//            }
//        }
