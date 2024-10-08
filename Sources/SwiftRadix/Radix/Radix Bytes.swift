//
//  Radix Bytes.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

extension Radix {
    /// Returns a raw byte array of the value (agnostic of radix base).
    ///
    /// All bytes for the integer are returned, since they are fixed-width numbers.
    /// (ie: `UInt8` returns one byte, but `Int` will return 8 bytes on 64-bit systems.)
    ///
    ///      UInt8(0xFF).hex.bytes // [0xFF]
    ///     UInt16(0xFF).hex.bytes // [0xFF,0x00]
    ///        Int(0xFF).hex.bytes // [0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00]
    ///
    @inlinable
    public var bytes: [UInt8] {
        var mutableValueCopy = value
        return withUnsafeBytes(of: &mutableValueCopy) { Array($0) }
    }
}
