//
//  DataAvailability.swift
//  iokiAR
//
//  Created by Nikolaos Makris on 18.04.19.
//  Copyright © 2019 Nikolaos Makris. All rights reserved.
//

import UIKit

// protocol to check if data is available
public protocol DataAvailability: class {
    var isDataAvailable: Bool { get set }
}
