//
//  Hex.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

/// Convenience constructor for `Radix<T>` with a radix of 16 (hex).
@inline(__always) @_disfavoredOverload
public func Hex<T: BinaryInteger>(_ number: T) -> Radix<T> {
    Radix<T>(number, unsafeBase: 16)
}

/// Convenience constructor for `Radix<Int>` with a radix of 16 (hex).
@inlinable @_disfavoredOverload
public func Hex<S: StringProtocol>(_ string: S) -> Radix<Int>? {
    Radix<Int>(string, base: 16)
}

/// Convenience constructor for `Radix<T>` with a radix of 16 (hex).
///
/// Example usage:
///
///     Hex("FF", as: Int16.self)
///
@inlinable @_disfavoredOverload
public func Hex<
    S: StringProtocol,
    T: BinaryInteger
>(
    _ string: S,
    as type: T.Type
) -> Radix<T>? {
    Radix<T>(string, base: 16)
}
