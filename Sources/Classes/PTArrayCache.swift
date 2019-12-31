//
//  PTArrayCache.swift
//  Phez Technologies Internal Framework
//
//  Created by Ken Pham on 12/7/19.
//  Copyright © 2019 Kenneth Pham. All rights reserved.
//

import Foundation

public struct PTArrayCache<Value> {
    public typealias ArrayCache = [Value]
    private var cache: ArrayCache
    private(set) public var maxLength: Int
    
    public init (_ values: ArrayCache = ArrayCache(), max length: Int) {
        self.cache = values.count > length ? Array(values[0..<length]) : values
        self.maxLength = length
    }
}

extension PTArrayCache: Collection {
    public typealias Index = ArrayCache.Index
    
    public var startIndex: Index {
        get { cache.startIndex }
    }
    
    public var endIndex: Index {
        get { cache.endIndex }
    }
    
    public subscript(position: Index) -> Value {
        get { cache[position] }
    }
    
    public func index(after i: Index) -> Index {
        return cache.index(after: i)
    }
    
    public mutating func append (_ value: Value) {
        cache.append(value)
        let remove = cache.count - maxLength
        cache.removeFirst(remove > 0 ? remove:0)
    }
    
    public mutating func remove (at position: Index) {
        cache.remove(at: position)
    }
}

extension PTArrayCache: CustomDebugStringConvertible {
    public var debugDescription: String {
        get { cache.debugDescription }
    }
}
