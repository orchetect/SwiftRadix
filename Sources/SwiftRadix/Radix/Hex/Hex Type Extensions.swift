//
//  Hex Type Extensions.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - Constructors

extension BinaryInteger {
    /// Returns a new `Radix<T>` base-16 struct from an integer, preserving the integer type.
    @inline(__always) @_disfavoredOverload
    public var hex: Radix<Self> {
        Radix(self, unsafeBase: 16)
    }
}

extension StringProtocol {
    /// Returns a new `Radix<Int>?` base-16 struct from a hex string.
    @inlinable @_disfavoredOverload
    public var hex: Radix<Int>? {
        Radix(self, base: 16)
    }
    
    /// Returns a new `Radix<T>?` base-16 struct from a hex string.
    ///
    /// Example usage:
    ///
    ///     "FF".hex(as: Int16.self)
    ///
    @inlinable @_disfavoredOverload
    public func hex<T: BinaryInteger>(as type: T.Type) -> Radix<T>? {
        Radix<T>(self, base: 16)
    }
}

extension Array where Element: StringProtocol {
    /// Returns an array of `Radix<Int>?` base-16 structs constructed from an array of hex strings.
    @_disfavoredOverload
    public var hex: [Radix<Int>?] {
        map { Radix<Int>($0, base: 16) }
    }
    
    /// Returns an array of `Radix<T>` base-16 structs constructed from an array of hex strings.
    ///
    /// Example usage:
    ///
    ///     ["0F", "FF"].hex(as: Int16.self)
    ///
    @_disfavoredOverload
    public func hex<T: BinaryInteger>(as type: T.Type) -> [Radix<T>?] {
        map { Radix<T>($0, base: 16) }
    }
}

extension Collection where Element: BinaryInteger {
    /// Returns an array of `Radix<T>` base-16 structs built from an integer array, preserving the integer type.
    @_disfavoredOverload
    public var hex: [Radix<Element>] {
        map { Radix($0, unsafeBase: 16) }
    }
}

extension Data {
    /// Returns an array of `Radix<UInt8>` base-16 structs built from Data bytes.
    @_disfavoredOverload
    public var hex: [Radix<UInt8>] {
        map { Radix($0, unsafeBase: 16) }
    }
}
