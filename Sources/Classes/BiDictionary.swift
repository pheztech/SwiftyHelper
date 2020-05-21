//
//  BiDictionary.swift
//  DevelopmentPlayground
//
//  Created by Ken Pham on 5/20/20.
//  Copyright © 2020 Kenneth Pham. All rights reserved.
//

import Foundation

public class BiDictionary<Key, Value>: NSMutableDictionary {
	public func set (_ value: Value, for key: Key) {
		self[key] = value
	}
	
	public func remove (for key: Key) {
		super.removeObject(forKey: key)
	}
	
	public func remove (for keys: [Key]) {
		super.removeObjects(forKeys: keys)
	}
	
	public func allKeys (for value: Value) -> [Key] {
		super.allKeys(for: value) as! [Key]
	}
}
