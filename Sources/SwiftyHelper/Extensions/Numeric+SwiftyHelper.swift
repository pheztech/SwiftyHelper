//
//  Numeric+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 7/19/20.
//  Copyright © 2020 Phez Technologies. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#else
import Foundation
#endif

// MARK: - Integer
public extension Int {
	var double: Double {
		Double(self)
	}
	
	var int16: Int16 {
		Int16(self)
	}
	
	var cgFloat: CGFloat {
		CGFloat(self)
	}
}

// MARK: - Double
public extension Double {
	var number: NSNumber {
		NSNumber(value: self)
	}
	
	var int: Int {
		Int(self)
	}
	
	var cgFloat: CGFloat {
		CGFloat(self)
	}
}

// MARK: - CGFloat
#if canImport(UIKit)
public extension CGFloat {
	var int: Int {
		Int(self)
	}
}
#endif
