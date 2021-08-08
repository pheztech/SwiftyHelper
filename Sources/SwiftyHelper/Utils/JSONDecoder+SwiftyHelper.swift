//
//  JSONDecoder+SwiftyHelper.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 8/22/20.
//  Copyright © 2020 Phez Technologies. All rights reserved.
//

import Foundation

public extension JSONDecoder {
	static var dependency: () -> JSONDecoder = JSONDecoder.init
}

public extension JSONEncoder {
	static var dependency: () -> JSONEncoder = JSONEncoder.init
}
