//
//  CustomView.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 05.05.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit

public class CustomView: UIView {
    
    var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.setRounded()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.numberOfLines = 2
        locationLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        locationLabel.font = UIFont(name: "CeraPro-Bold", size: 22.0)
        locationLabel.textAlignment = .left
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationLabel
    }()
    
    var distanceLabel: UILabel = {
        let distanceLabel = UILabel()
        distanceLabel.numberOfLines = 2
        distanceLabel.textColor = #colorLiteral(red: 0.6078431373, green: 0.6274509804, blue: 0.6666666667, alpha: 1)
        distanceLabel.font = UIFont(name: "CeraPro-Medium", size: 20.0)
        distanceLabel.textAlignment = .left
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        return distanceLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(avatarImageView)
        addSubview(locationLabel)
        addSubview(distanceLabel)
    }
    
    private func setupLayout() {
        let layoutArray: [NSLayoutConstraint] = [
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60.0),
            
            locationLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10.0),
            locationLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 5.0),
            
            distanceLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10.0),
            distanceLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -5.0)
        ]
        NSLayoutConstraint.activate(layoutArray)
    }
    
}
