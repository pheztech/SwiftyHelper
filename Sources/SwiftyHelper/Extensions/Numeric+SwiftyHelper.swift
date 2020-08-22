//
//  Numeric+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 7/19/20.
//  Copyright © 2020 Phez Technologies. All rights reserved.
//

import Foundation

public extension Int {
	var double: Double {
		Double(self)
	}
}

public extension Double {
	var number: NSNumber {
		NSNumber(value: self)
	}
}
