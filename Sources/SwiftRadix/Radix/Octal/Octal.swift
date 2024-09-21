//
//  Octal.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

/// Convenience constructor for `Radix<T>` with a radix of 8 (octal).
@inline(__always) @_disfavoredOverload
public func Octal<T: BinaryInteger>(_ number: T) -> Radix<T> {
    Radix<T>(number, unsafeBase: 8)
}

/// Convenience constructor for `Radix<Int>` with a radix of 8 (octal).
@inlinable @_disfavoredOverload
public func Octal<S: StringProtocol>(_ string: S) -> Radix<Int>? {
    Radix<Int>(string, base: 8)
}

/// Convenience constructor for `Radix<T>` with a radix of 8 (octal).
///
/// Example usage:
///
///     Octal("123", as: Int16.self)
///
@inlinable @_disfavoredOverload
public func Octal<
    S: StringProtocol,
    T: BinaryInteger
>(
    _ string: S,
    as type: T.Type
) -> Radix<T>? {
    Radix<T>(string, base: 8)
}
