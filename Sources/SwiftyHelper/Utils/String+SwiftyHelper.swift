//
//  String+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 7/23/21.
//  Copyright © 2021 Phez Technologies. All rights reserved.
//

import Foundation

// https://useyourloaf.com/blog/empty-strings-in-swift/

public extension String {
    var isBlank: Bool {
        self.allSatisfy { $0.isWhitespace }
    }
}

public extension Optional where Wrapped == String {
    var isBlank: Bool {
        self?.isBlank ?? true
    }
}
