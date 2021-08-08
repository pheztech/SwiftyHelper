//
//  Logger+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 7/10/21.
//  Copyright © 2021 Phez Technologies. All rights reserved.
//

import Foundation
import os

public extension Logger {
    static let coreData = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "CoreData")
    static let app = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "App")
}
