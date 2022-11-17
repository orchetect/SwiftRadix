//
//  Binary Type Extensions.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - Constructors

extension BinaryInteger {
    /// Returns a new `Radix<T>` base-2 struct from an integer, preserving the integer type.
    @inline(__always) @_disfavoredOverload
    public var binary: Radix<Self> {
        Radix(self, unsafeBase: 2)
    }
}

extension StringProtocol {
    /// Returns a new `Radix<Int>?` base-2 struct from a binary string.
    @inlinable @_disfavoredOverload
    public var binary: Radix<Int>? {
        Radix(self, base: 2)
    }
    
    /// Returns a new `Radix<T>?` base-2 struct from a binary string.
    ///
    /// Example usage:
    ///
    ///     "1010".binary(as: Int16.self)
    ///
    @inlinable @_disfavoredOverload
    public func binary<T: BinaryInteger>(as type: T.Type) -> Radix<T>? {
        Radix<T>(self, base: 2)
    }
}

extension Array where Element: StringProtocol {
    /// Returns an array of `Radix<Int>?` base-2 structs constructed from an array of binary
    /// strings.
    @_disfavoredOverload
    public var binary: [Radix<Int>?] {
        map { Radix<Int>($0, base: 2) }
    }
    
    /// Returns an array of `Radix<T>?` base-2 structs constructed from an array of binary strings.
    ///
    /// Example usage:
    ///
    ///     ["1010", "1111"].binary(as: Int16.self)
    ///
    @_disfavoredOverload
    public func binary<T: BinaryInteger>(as type: T.Type) -> [Radix<T>?] {
        map { Radix<T>($0, base: 2) }
    }
}

extension Collection where Element: BinaryInteger {
    /// Returns an array of `Radix<T>` base-2 structs built from an integer array, preserving the
    /// integer type.
    @_disfavoredOverload
    public var binary: [Radix<Element>] {
        map { Radix($0, unsafeBase: 2) }
    }
}

extension Data {
    /// Returns an array of `Radix<UInt8>` base-2 structs built from `Data` bytes.
    @_disfavoredOverload
    public var binary: [Radix<UInt8>] {
        map { Radix($0, unsafeBase: 2) }
    }
}
