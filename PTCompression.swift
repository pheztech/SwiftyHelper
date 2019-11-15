//
//  PTCompression.swift
//  Phez Technologies Internal Framework
//
//  Created by Ken Pham on 11/8/19.
//  Copyright © 2019 Kenneth Pham. All rights reserved.
//

import Foundation
import Compression

// Compression Algorithms
// 355 -> 234 [zLib]
// 355 -> 312 [LZMA]
// LZ4 failed
// 355 -> 321 [LZFSE, Apple Only]
// 355 -> 344 [LZ4_RAW]
final public class PTCompression: NSObject {
    private override init() {
        super.init()
    }
    
    public static func compress (_ data: Data) -> Data? {
        var sourceBuffer = Array(data)
        
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: data.count)
        let compressedSize = compression_encode_buffer(buffer, data.count, &sourceBuffer, data.count, nil, COMPRESSION_ZLIB)
        
        guard compressedSize != 0 else { return nil }
        return Data(bytesNoCopy: buffer, count: compressedSize, deallocator: .free)
    }
    
    public static func decompress (_ data: Data) -> Data? {
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 500)
        
        let decompressed: Data? = data.withUnsafeBytes {
            guard let source = $0.bindMemory(to: UInt8.self).baseAddress else { return nil }
            
            let size = compression_decode_buffer(buffer, 500, source, data.count, nil, COMPRESSION_ZLIB)
            guard size != 0 else { return nil }
            return Data(bytesNoCopy: buffer, count: size, deallocator: .free)
        }
        return decompressed
    }
}
