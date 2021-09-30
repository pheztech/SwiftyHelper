//
//  UserDefaults+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 9/26/21.
//  Copyright © 2021 Phez Technologies. All rights reserved.
//

import Foundation

public extension UserDefaults {
    func set (_ value: UUID?, forKey defaultName: String) {
        self.set(value?.uuidString, forKey: defaultName)
    }
    
    func uuid (forKey defaultName: String) -> UUID? {
        guard let uuidString = self.string(forKey: defaultName) else { return nil }
        return UUID(uuidString: uuidString)
    }
}

// MARK: AppStorage Type extension
extension UUID: RawRepresentable {
    public init? (rawValue: String) {
        self.init(uuidString: rawValue)
    }
    
    public var rawValue: String {
        self.uuidString
    }
}
