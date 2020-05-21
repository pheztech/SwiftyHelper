//
//  BiDictionary.swift
//  DevelopmentPlayground
//
//  Created by Ken Pham on 5/20/20.
//  Copyright © 2020 Kenneth Pham. All rights reserved.
//

import Foundation

public class BiDictionary<Key, Value>: NSObject {
	private var dictionary = NSMutableDictionary()
	
	public func set (_ value: Value, for key: Key) {
		dictionary[key] = value
	}
	
	public func remove (for key: Key) {
		dictionary.removeObject(forKey: key)
	}
	
	public func remove (for keys: [Key]) {
		dictionary.removeObjects(forKeys: keys)
	}
	
	public func allKeys (for value: Value) -> [Key] {
		dictionary.allKeys(for: value) as! [Key]
	}
}
