//
//  DateFormatter+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 8/20/21.
//  Copyright © 2020 Phez Technologies. All rights reserved.
//

import Foundation

public extension DateFormatter {
    static var timerFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "m:ss"
        return formatter
    }()
}
