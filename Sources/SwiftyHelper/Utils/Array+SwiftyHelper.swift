//
//  Array+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 9/28/21.
//  Copyright © 2021 Phez Technologies. All rights reserved.
//

import Foundation

public extension Array {
    /// Will return `nil` if the array is empty
    func joined (_ keyPath: KeyPath<Element, String>, separator: String = ",") -> String? {
        guard !self.isEmpty else { return nil }
        return self.map { $0[keyPath: keyPath] }.joined(separator: separator)
    }
}
