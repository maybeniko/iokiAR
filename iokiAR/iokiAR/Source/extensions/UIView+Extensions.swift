//
//  UIView+Extensions.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 13.05.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
