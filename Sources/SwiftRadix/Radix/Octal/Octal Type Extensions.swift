//
//  Octal Type Extensions.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - Constructors

extension BinaryInteger {
    /// Returns a new `Radix<T>` base-8 struct from an integer, preserving the integer type.
    @inline(__always) @_disfavoredOverload
    public var octal: Radix<Self> {
        Radix(self, unsafeBase: 8)
    }
}

extension StringProtocol {
    /// Returns a new `Radix<Int>?` base-8 struct from an octal string.
    @inlinable @_disfavoredOverload
    public var octal: Radix<Int>? {
        Radix(self, base: 8)
    }
    
    /// Returns a new `Radix<T>?` base-8 struct from a octal string.
    ///
    /// Example usage:
    ///
    ///     "123".octal(as: Int16.self)
    ///
    @inlinable @_disfavoredOverload
    public func octal<T: BinaryInteger>(as type: T.Type) -> Radix<T>? {
        Radix<T>(self, base: 8)
    }
}

extension Array where Element: StringProtocol {
    /// Returns an array of `Radix<Int>?` base-8 structs constructed from an array of octal strings.
    @_disfavoredOverload
    public var octal: [Radix<Int>?] {
        map { Radix<Int>($0, base: 8) }
    }
    
    /// Returns an array of `Radix<T>?` base-8 structs constructed from an array of octal strings.
    ///
    /// Example usage:
    ///
    ///     ["47", "123"].octal(as: Int16.self)
    ///
    @_disfavoredOverload
    public func octal<T: BinaryInteger>(as type: T.Type) -> [Radix<T>?] {
        map { Radix<T>($0, base: 8) }
    }
}

extension Collection where Element: BinaryInteger {
    /// Returns an array of `Radix<T>` base-8 structs built from an integer array, preserving the
    /// integer type.
    @_disfavoredOverload
    public var octal: [Radix<Element>] {
        map { Radix($0, unsafeBase: 8) }
    }
}

extension Data {
    /// Returns an array of `Radix<UInt8>` base-8 structs built from Data bytes.
    @_disfavoredOverload
    public var octal: [Radix<UInt8>] {
        map { Radix($0, unsafeBase: 8) }
    }
}
