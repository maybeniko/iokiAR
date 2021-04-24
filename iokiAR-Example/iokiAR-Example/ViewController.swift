//
//  ViewController.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 02.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import CoreLocation
import iokiAR
import MapKit


class ViewController: UIViewController{
    
    private var arLocations = [ARLocation]()
    private var routes = [ARRoute]()
    private var driverData = [ARDriverDetails]()
    lazy var vc = iokiAR.createViewController(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        present(vc, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.vc.isDataAvailable = true
        })
    }
    
}

extension ViewController: IokiARDelegate {
    
    
    // track the driver
    func getDriverDetails() -> [ARDriverDetails] {
        
        let coordinate1 = CLLocationCoordinate2D(latitude: 50.117872646078474, longitude: 8.672072004683343)
        
        let driverLocation1 = ARDriverDetails(location: coordinate1)
        driverData.append(driverLocation1)
        
        let coordinate2 = CLLocationCoordinate2D(latitude: 50.11794716119767, longitude: 8.672078291110722)
        
        let driverLocation2 = ARDriverDetails(location: coordinate2)
        driverData.append(driverLocation2)
        
        return driverData
    }
    
    // draw route in augmented reality
    func getARRoute() -> [ARRoute] {
        
        let coordinates = [CLLocationCoordinate2D(latitude: 50.117346, longitude: 8.671037),
                           CLLocationCoordinate2D(latitude: 50.117318, longitude: 8.671043),
                           CLLocationCoordinate2D(latitude: 50.117290, longitude: 8.671053),
                           CLLocationCoordinate2D(latitude: 50.117263, longitude: 8.671064),
                           CLLocationCoordinate2D(latitude: 50.117232, longitude: 8.671053),
                           CLLocationCoordinate2D(latitude: 50.117184, longitude: 8.671043)]
        
        let shortRoute = ARRoute(coordinates: coordinates)
        
        routes.append(shortRoute)
        
        return routes
    }
    
    // set up ARPins
    func getARLocations() -> [ARLocation] {
        
        
        let customStyleDean = ARStyle(textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bgColor: UIColor.white.withAlphaComponent(0.85), textFont: UIFont(name: "CeraPro-Bold", size: 22)!, roundedCorners: 0.10)
        
        
        let deanCoordinate = CLLocationCoordinate2D(latitude: 50.117122, longitude: 8.672317)
        let deanLocation = CLLocation(coordinate: deanCoordinate, altitude: 100)
        
        let deanARLocation = ARLocation(locationAvatar: #imageLiteral(resourceName: "pin"), location: deanLocation, pinStyle: customStyleDean, pinText: "dean&david 🌮", type: .vehicle)
        arLocations.append(deanARLocation)
        
        
        let coordinate2 = CLLocationCoordinate2D(latitude: 50.116001, longitude: 8.670737)
        let location2 = CLLocation(coordinate: coordinate2, altitude: 100)
        
        let skylineLocation = ARLocation(locationAvatar: #imageLiteral(resourceName: "pin"), location: location2, pinStyle: customStyleDean, pinText: "Skyline Plaza 🏪", type: .vehicle)
        arLocations.append(skylineLocation)
        
        
        let gemeindeCoordinate = CLLocationCoordinate2D(latitude: 50.117934, longitude: 8.672724)
        let gemeindeLocation = CLLocation(coordinate: gemeindeCoordinate, altitude: 100)
        
        let gemeindeLoc = ARLocation(locationAvatar: #imageLiteral(resourceName: "pin"), location: gemeindeLocation, pinStyle: customStyleDean, pinText: "Gemeinde", type: .station)
        
        arLocations.append(gemeindeLoc)
        
        let cornerCoordinate = CLLocationCoordinate2D(latitude: 50.116843, longitude: 8.672901)
        let cornerLocation = CLLocation(coordinate: cornerCoordinate, altitude: 100)
        
        let cornerLoc = ARLocation(locationAvatar: #imageLiteral(resourceName: "pin"), location: cornerLocation, pinStyle: customStyleDean, pinText: "Corner", type: .vehicle)
        
        arLocations.append(cornerLoc)
        
        let bockenheimCoordinate = CLLocationCoordinate2D(latitude: 50.117810, longitude: 8.671090)
        let bockenheimLocation = CLLocation(coordinate: bockenheimCoordinate, altitude: 100)
        
        let bockenheimLoc = ARLocation(locationAvatar: #imageLiteral(resourceName: "pin"), location: bockenheimLocation, pinStyle: customStyleDean, pinText: "Fitness First", type: .vehicle)
        
        arLocations.append(bockenheimLoc)
        
        let operCoordinate = CLLocationCoordinate2D(latitude: 50.116485, longitude: 8.672168)
        let operLocation = CLLocation(coordinate: operCoordinate, altitude: 105)
        let operLocation2 = CLLocation(coordinate: operCoordinate, altitude: 95)
        
        let alteOperLoc = ARLocation(locationAvatar: #imageLiteral(resourceName: "pin"), location: operLocation, pinStyle: customStyleDean, pinText: "Alte Oper", type: .vehicle)
        
        arLocations.append(alteOperLoc)
        
        let pinOper = ARLocation(locationAvatar: #imageLiteral(resourceName: "pin"), location: operLocation2, pinStyle: customStyleDean, pinText: "Alte Oper", type: .station)
        
        arLocations.append(pinOper)
        
        
        let randomCoordinate = CLLocationCoordinate2D(latitude: 50.117533, longitude: 8.670339)
        let randomLoc = CLLocation(coordinate: randomCoordinate, altitude: 100)
        
        let randomLocation = ARLocation(locationAvatar: #imageLiteral(resourceName: "pin"), location: randomLoc, pinStyle: customStyleDean, pinText: "Rothschildpark🗼", type: .vehicle)
        
        arLocations.append(randomLocation)
        
        
        return arLocations
    }
    
}


