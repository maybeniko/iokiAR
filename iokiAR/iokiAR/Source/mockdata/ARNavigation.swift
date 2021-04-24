//
//  ARNavigation.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 06.05.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import Foundation

//private let adjustNorthByTappingSidesOfScreen = false
//
//private var userLocation = CLLocation()
//private let locationManager = CLLocationManager()
//private var distance : Float!
//private var modelNode:SCNNode!
//private let rootNodeName = "point"
//private var originalTransform:SCNMatrix4!
//private var heading : Double! = 0.0
//private var count : Int! = 0

//    func trackDriver() {
//
//        let driverData = delegate?.getDriverDetails() ?? []
//
//track driver with 3d object in real world
//        buildNode(driverData: driverData)
//    }

//    func buildNode(driverData: [ARDriverDetails]) {
//
//        for driver in driverData {
//
//            self.distance = Float(driver.location.distance(from: userLocation.coordinate))
//
//            let location = CLLocation(latitude: driver.location.latitude, longitude: driver.location.longitude)
//
//            let modelScene = SCNScene(named: "point.dae")!
//            self.modelNode = modelScene.rootNode.childNode(withName: rootNodeName, recursively: true)!
//
//            // Move model's pivot to its center in the Y axis
//            let (minBox, maxBox) = self.modelNode.boundingBox
//            self.modelNode.pivot = SCNMatrix4MakeTranslation(0, (maxBox.y - minBox.y)/2, 0)
//            self.modelNode.eulerAngles = SCNVector3(0, 0, 46)
//
//            // Save original transform to calculate future rotations
//            self.originalTransform = self.modelNode.transform
//
//            // Position the model in the correct place
//            positionModel(location)
//
//            // Add the model to the scene
//            sceneLocationView.scene.rootNode.addChildNode(self.modelNode)
//
//        }
//    }

//    func positionModel(_ location: CLLocation) {
//
//        // Rotate node
//        self.modelNode.transform = rotateNode(Float(-1 * (self.heading - 180).toRadians()), self.originalTransform)
//
//        // Translate node
//        self.modelNode.position = translateNode(location)
//
//        // Scale node
//        self.modelNode.scale = scaleNode(location)
//    }
//
//    func rotateNode(_ angleInRadians: Float, _ transform: SCNMatrix4) -> SCNMatrix4 {
//
//        let rotation = SCNMatrix4MakeRotation(angleInRadians, 0, 0, 0)
//        return SCNMatrix4Mult(transform, rotation)
//    }
//
//    func translateNode (_ location: CLLocation) -> SCNVector3 {
//
//        let locationTransform = transformMatrix(matrix_identity_float4x4, userLocation, location)
//        return positionFromTransform(locationTransform)
//    }
//
//    func scaleNode (_ location: CLLocation) -> SCNVector3 {
//
//        let scale = max( min( Float(1000/distance), 1.5 ), 3)
//        return SCNVector3(x: scale, y: scale, z: scale)
//    }
//
//    func positionFromTransform(_ transform: simd_float4x4) -> SCNVector3 {
//        return SCNVector3Make(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
//    }
//
//    @objc
//    func updatePinDistance() {
//
//        let driverDet = delegate?.getDriverDetails() ?? []
//        for driver in driverDet {
//            let location = CLLocation(latitude: driver.location.latitude, longitude: driver.location.longitude)
//            self.distance = Float(driver.location.distance(from: userLocation.coordinate))
//            self.modelNode.position = self.translateNode(location)
//            self.modelNode.scale = self.scaleNode(location)
//        }
//    }
//
//    func transformMatrix(_ matrix: simd_float4x4, _ originLocation: CLLocation, _ driverLocation: CLLocation) -> simd_float4x4 {
//
//        let bearing = bearingBetweenLocations(userLocation, driverLocation)
//        let rotationMatrix = rotateAroundY(matrix_identity_float4x4, Float(bearing))
////
//        print(bearing)
//
//        distance = Float(driverLocation.distance(from: userLocation))
//
////        var position: vector_float4
////
////        print(distance!)
////        trackingStateLabel.text = String(distance)
//////         set pin higher if distance is bigger than 35 meter
////        if distance > 15 {
////            position = vector_float4(0.0, 40.0, -distance, 0)
////        } else {
//        let position = vector_float4(0.0, -10.0, -distance, 0)
////        }
//
//        let translationMatrix = getTranslationMatrix(matrix_identity_float4x4, position)
//
//        let transformMatrix = simd_mul(rotationMatrix, translationMatrix)
//
//        return simd_mul(matrix, transformMatrix)
//    }
//
//    func getTranslationMatrix(_ matrix: simd_float4x4, _ translation : vector_float4) -> simd_float4x4 {
//
//        var matrix = matrix
//        matrix.columns.3 = translation
//        return matrix
//    }
//
//    func rotateAroundY(_ matrix: simd_float4x4, _ degrees: Float) -> simd_float4x4 {
//
//        var matrix = matrix
//
////        print(degrees)
//
//        matrix.columns.0.x = cos(degrees)
//        matrix.columns.0.z = -sin(degrees)
//
//        matrix.columns.2.x = sin(degrees)
//        matrix.columns.2.z = cos(degrees)
//        return matrix.inverse
//    }
//
//    func bearingBetweenLocations(_ originLocation: CLLocation, _ driverLocation: CLLocation) -> Double {
//
//        let lat1 = originLocation.coordinate.latitude.toRadians()
//        let lon1 = originLocation.coordinate.longitude.toRadians()
//
//        let lat2 = driverLocation.coordinate.latitude.toRadians()
//        let lon2 = driverLocation.coordinate.longitude.toRadians()
//
//        let longitudeDiff = lon2 - lon1
//
//        let y = sin(longitudeDiff) * cos(lat2);
//        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(longitudeDiff);
//
//        return atan2(y, x)
//    }
//
//    func makeBillboardNode(_ image: UIImage) -> SCNNode {
//
//        let plane = SCNPlane(width: 10, height: 10)
//        plane.firstMaterial!.diffuse.contents = image
//        let node = SCNNode(geometry: plane)
//        node.constraints = [SCNBillboardConstraint()]
//        return node
//    }
//
