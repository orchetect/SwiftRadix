//
//  Radix Type Extensions.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - Constructors

extension BinaryInteger {
    /// Returns a new `Radix<T>` struct from an integer, preserving the integer type.
    @inline(__always) @_disfavoredOverload
    public func radix(base: Int) -> Radix<Self>? {
        Radix(self, base: base)
    }
}

extension StringProtocol {
    /// Returns a new `Radix<Int>?` struct from a radix string.
    @inlinable @_disfavoredOverload
    public func radix(base: Int) -> Radix<Int>? {
        Radix(self, base: base)
    }
    
    /// Returns a new `Radix<T>?` struct from a radix string.
    ///
    /// Example usage:
    ///
    ///     "123".radix(base: 4, as: Int16.self)
    ///
    @inlinable @_disfavoredOverload
    public func radix<T: BinaryInteger>(
        base: Int,
        as type: T.Type
    ) -> Radix<T>? {
        Radix<T>(self, base: base)
    }
}

extension Array where Element: StringProtocol {
    /// Returns an array of `Radix<Int>?` structs constructed from an array of hex strings.
    @_disfavoredOverload
    public func radix(base: Int) -> [Radix<Int>?] {
        map { Radix<Int>($0, base: base) }
    }
    
    /// Returns an array of `Radix<T>?` structs constructed from an array of radix strings.
    ///
    /// Example usage:
    ///
    ///     ["20", "123"].radix(base: 4, as: Int16.self)
    ///
    @_disfavoredOverload
    public func radix<T: BinaryInteger>(
        base: Int,
        as type: T.Type
    ) -> [Radix<T>?] {
        map { Radix<T>($0, base: base) }
    }
}

extension Collection where Element: BinaryInteger {
    /// Returns an array of `Radix<T>` structs built from an integer array, preserving the integer
    /// type.
    @_disfavoredOverload
    public func radix(base: Int) -> [Radix<Element>]? {
        // radix validity check
        if base < 2 || base > 36 { return nil }
        
        return map { Radix($0, unsafeBase: base) }
    }
}

extension Data {
    /// Returns an array of `Radix<UInt8>` structs built from Data bytes.
    @_disfavoredOverload
    public func radix(base: Int) -> [Radix<UInt8>]? {
        // radix validity check
        if base < 2 || base > 36 { return nil }
        
        return map { Radix($0, unsafeBase: base) }
    }
}
