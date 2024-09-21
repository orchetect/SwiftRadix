//
//  Binary.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

/// Convenience constructor for `Radix<T>` with a radix of 2 (binary).
@inline(__always) @_disfavoredOverload
public func Binary<T: BinaryInteger>(_ number: T) -> Radix<T> {
    Radix<T>(number, unsafeBase: 2)
}

/// Convenience constructor for `Radix<Int>` with a radix of 2 (binary).
@inlinable @_disfavoredOverload
public func Binary<S: StringProtocol>(_ string: S) -> Radix<Int>? {
    Radix<Int>(string, base: 2)
}

/// Convenience constructor for `Radix<T>` with a radix of 2 (binary).
///
/// Example usage:
///
///     Binary("1010", as: Int16.self)
///
@inlinable @_disfavoredOverload
public func Binary<
    S: StringProtocol,
    T: BinaryInteger
>(
    _ string: S,
    as type: T.Type
) -> Radix<T>? {
    Radix<T>(string, base: 2)
}
