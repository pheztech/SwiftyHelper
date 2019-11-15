//
//  PTGenerator.swift
//  Phez Technologies Internal Framework
//
//  Created by Ken Pham on 11/10/19.
//  Copyright © 2019 Kenneth Pham. All rights reserved.
//

import Foundation

public class PTGenerator: NSObject {
    public static func randomString (ofLength length: Int) -> String {
        let alphanum = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<4).map{ _ in alphanum.randomElement()! })
    }
}
