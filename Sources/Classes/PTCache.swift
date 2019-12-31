//
//  PTCache.swift
//  Phez Technologies Internal Framework
//  https://www.swiftbysundell.com/articles/caching-in-swift/
//
//  Created by Ken Pham on 12/6/19.
//  Copyright © 2019 Kenneth Pham. All rights reserved.
//

import Foundation

public final class PTCache<Key: Hashable, Value> {
    private let wrapped = NSCache<WrappedKey, Entry>()
    private let dateProvider: () -> Date
    private let entryLifetime: TimeInterval
    
    public init (dateProvider: @escaping ()->Date = Date.init, lifetime: TimeInterval = 12 * 60 * 60) {
        self.dateProvider = dateProvider
        self.entryLifetime = lifetime
    }
    
    public func insert (_ value: Value, for key: Key) {
        let date = dateProvider().addingTimeInterval(entryLifetime)
        let entry = Entry(value, expires: date)
        wrapped.setObject(entry, forKey: WrappedKey(key))
    }
    
    public func value (for key: Key) -> Value? {
        guard let entry = wrapped.object(forKey: WrappedKey(key)) else { return nil }
        guard dateProvider() < entry.expires else { remove(valueFor: key); return nil }
        return entry.value
    }
    
    public func remove (valueFor key: Key) {
        wrapped.removeObject(forKey: WrappedKey(key))
    }
}

private extension PTCache {
    final class WrappedKey: NSObject {
        let key: Key

        init (_ key: Key) {
            self.key = key
        }

        override var hash: Int {
            get { key.hashValue }
        }

        override func isEqual(_ object: Any?) -> Bool {
            guard let other = object as? WrappedKey else { return false }
            return other.key == key
        }
    }
    
    final class Entry {
        let value: Value
        let expires: Date
        
        init (_ value: Value, expires date: Date) {
            self.value = value
            self.expires = date
        }
    }
    
    subscript (key: Key) -> Value? {
        get { value(for: key) }
        set {
            guard let value = newValue else { return remove(valueFor: key) }
            insert(value, for: key)
        }
    }
}
