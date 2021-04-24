//
//  AugmentedViewController.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 03.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import MapKit


final class AugmentedViewController: UIViewController, DataAvailability, LNTouchDelegate {
    
    private let sceneLocationView = SceneLocationView()
    private let sceneManager: SceneManager
    
    private weak var delegate: IokiARDelegate?
    private var updateUserLocationTimer: Timer?
    
    var pinHolder = [LocationAnnotationNode]()
    
    var updateInfoLabelTimer: Timer?
    
    var isDataAvailable: Bool = false {
        didSet {
            guard self.isDataAvailable else {
                return
            }
            updateTextIndicator()
            addSceneModels()
            print("Data Available")
            self.isDataAvailable = false
        }
    }
    
    private var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Point your camera towards North to see your destination."
        label.textColor = .white
        label.font = UIFont(name: "CeraPro-Bold", size: 18.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.5996368838)
        view.layer.cornerRadius = 23.0
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var locationDistance: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "CeraPro-Bold", size: 50.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var locationName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "CeraPro-Medium", size: 18.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    init(delegate: IokiARDelegate) {
        
        self.delegate = delegate
        self.sceneManager = SceneManager(delegate: delegate)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sceneLocationView)
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        view.addSubview(infoView)
        infoView.addSubview(locationDistance)
        infoView.addSubview(locationName)
        
        self.sceneLocationView.locationNodeTouchDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sceneLocationView.run()
        setupLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneLocationView.pause()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sceneLocationView.frame = view.bounds
    }
    
    private func setupLayout() {
        
        let layoutArray: [NSLayoutConstraint] = [
            imageView.widthAnchor.constraint(equalToConstant: 122.0),
            imageView.heightAnchor.constraint(equalToConstant: 122.0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 270.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25.0),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 250.0),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            infoView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            locationName.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            locationName.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 20.0),
            
            locationDistance.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            locationDistance.centerYAnchor.constraint(equalTo: infoView.centerYAnchor, constant: 8.0)
        ]
        
        NSLayoutConstraint.activate(layoutArray)
    }
    
    internal func locationNodeTouched(node: AnnotationNode) {
        
        if let location = node.coordinate {
            
            DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                self!.locationName.text = String((node.view?.locationLabel.text)!)
                self!.locationDistance.text = String(location.distance(from: self!.sceneLocationView.sceneLocationManager.currentLocation!.coordinate).rounded()) + "m"
                
                self!.infoView.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
                UIView.animate(withDuration: 0.5) {
                    self!.view.layoutIfNeeded()
                }
            }
        }
    }
    
    private func updateTextIndicator() {
        UIView.animate(withDuration: 0.4) {
            self.descriptionLabel.text = "Walk in the Direction of the ioki pin."
            self.view.layoutIfNeeded()
        }
    }
    
    private func addSceneModels() {
        
        guard sceneLocationView.sceneLocationManager.currentLocation != nil else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.addSceneModels()
            }
            return
        }
        
        buildData().forEach {
            sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: $0)
        }
        
        updateInfoLabelTimer = Timer.scheduledTimer(timeInterval: 2,
                                                    target: self,
                                                    selector: #selector(self.updateInfoLabel),
                                                    userInfo: nil,
                                                    repeats: true)
    }
    
    private func buildData() -> [LocationAnnotationNode] {
        
        let userLocation = sceneLocationView.sceneLocationManager.currentLocation!
        let rawLocation = delegate?.getARLocations() ?? []
        
        return sceneManager.buildStationData(stations: rawLocation, currentLocation: userLocation)
    }
    
    @objc func updateInfoLabel() {
        
        let rawLocation = delegate?.getARLocations() ?? []
        
        for location in rawLocation {
            DispatchQueue.main.async() {
                self.locationDistance.text = String(location.location.distance(from: self.sceneLocationView.sceneLocationManager.currentLocation!).rounded()) + "m"
            }
        }
    }
    
    private func removeNodes() {
        sceneLocationView.removeAllNodes()
    }
    
    
}
