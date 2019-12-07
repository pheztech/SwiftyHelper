//
//  PTArrayCache.swift
//  Phez Technologies Internal Framework
//
//  Created by Ken Pham on 12/7/19.
//  Copyright © 2019 Kenneth Pham. All rights reserved.
//

import Foundation

struct PTArrayCache<Value> {
    typealias ArrayCache = [Value]
    private var cache: ArrayCache
    private(set) public var maxLength: Int
    
    init (_ values: ArrayCache = ArrayCache(), max length: Int) {
        self.cache = values.count > length ? Array(values[0..<length]) : values
        self.maxLength = length
    }
}

extension PTArrayCache: Collection {
    typealias Index = ArrayCache.Index
    
    var startIndex: Index {
        get { cache.startIndex }
    }
    
    var endIndex: Index {
        get { cache.endIndex }
    }
    
    subscript(position: Index) -> Value {
        get { cache[position] }
    }
    
    func index(after i: Index) -> Index {
        return cache.index(after: i)
    }
    
    mutating func append (_ value: Value) {
        cache.append(value)
        let remove = cache.count - maxLength
        cache.removeFirst(remove > 0 ? remove:0)
    }
    
    mutating func remove (at position: Index) {
        cache.remove(at: position)
    }
}

extension PTArrayCache: CustomDebugStringConvertible {
    var debugDescription: String {
        get { cache.debugDescription }
    }
}
