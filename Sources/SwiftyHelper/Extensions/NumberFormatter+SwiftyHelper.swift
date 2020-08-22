//
//  NumberFormatter+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 8/14/20.
//  Copyright © 2020 Phez Technologies. All rights reserved.
//

import Foundation

public extension NumberFormatter {
	static var currency: () -> NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.locale = .enUS
		
		return formatter
	}
}

public extension Locale {
	static var enUS = Locale(identifier: "en_US")
}
