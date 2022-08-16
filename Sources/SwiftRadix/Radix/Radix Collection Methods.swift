//
//  Radix Collection Methods.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - .stringValue

extension Collection where Element: RadixProtocol {
    /// Convert an array of `Radix` to a concatenated `String` of radix string values.
    public var stringValue: String {
        map { $0.stringValue }
            .joined(separator: " ")
    }
    
    /// Convert an array of `Radix` to a concatenated `String` of radix string values, each value padded to the number of characters specified.
    public func stringValue(prefix: Bool) -> String {
        map { $0.stringValue(prefix: prefix) }
            .joined(separator: " ")
    }
    
    /// Convert an array of `Radix` to a concatenated `String` of radix string values, each value padded to the number of characters specified.
    public func stringValue(
        padTo: Int,
        prefix: Bool = false
    ) -> String {
        map {
            $0.stringValue(
                padTo: padTo,
                splitEvery: 0,
                prefix: prefix
            )
        }
        .joined(separator: " ")
    }
    
    /// Convert an array of `Radix` to a concatenated `String` of radix string values, each value padded to multiples of the number of characters specified.
    public func stringValue(
        padToEvery: Int,
        prefix: Bool = false
    ) -> String {
        map {
            $0.stringValue(
                padToEvery: padToEvery,
                splitEvery: 0,
                prefix: prefix
            )
        }
        .joined(separator: " ")
    }
}

// MARK: - .stringValueArrayLiteral

extension Collection where Element: RadixProtocol {
    /// Format an array of `Radix` as a Swift array literal, useful for generating Swift array declarations.
    public var stringValueArrayLiteral: String {
        stringValueArrayLiteral(padToEvery: 0)
    }
    
    /// Format an array of `Radix` as a Swift array literal, useful for generating Swift array declarations, each value padded to the number of characters specified.
    public func stringValueArrayLiteral(padTo: Int) -> String {
        "["
            + stringValues(padTo: padTo, prefixes: true)
            .joined(separator: ", ")
            + "]"
    }
    
    /// Format an array of `Radix` as a Swift array literal, useful for generating Swift array declarations, each value padded to multiples of the number of characters specified.
    public func stringValueArrayLiteral(padToEvery: Int) -> String {
        "["
            + stringValues(padToEvery: padToEvery, prefixes: true)
            .joined(separator: ", ")
            + "]"
    }
}

// MARK: - .stringValues

extension Collection where Element: RadixProtocol {
    /// Convert an array of `Radix` to an array of radix string values.
    public var stringValues: [String] {
        stringValues(padTo: 0)
    }
    
    /// Convert an array of `Radix` to an array of radix string values, each value padded to the number of characters specified.
    public func stringValues(
        padTo: Int,
        prefixes: Bool = false
    ) -> [String] {
        map {
            $0.stringValue(
                padTo: padTo,
                splitEvery: 0,
                prefix: prefixes
            )
        }
    }
    
    /// Convert an array of `Radix` to an array of radix string values, each value padded to multiples of the number of characters specified.
    public func stringValues(
        padToEvery: Int,
        prefixes: Bool = false
    ) -> [String] {
        map {
            $0.stringValue(
                padToEvery: padToEvery,
                splitEvery: 0,
                prefix: prefixes
            )
        }
    }
}

// MARK: - .values

/// Extension on `[RadixProtocol<T>]`
extension Collection where Element: RadixProtocol {
    /// Returns an array of extracted values.
    @inlinable
    public var values: [Element.NumberType] {
        map { $0.value }
    }
}

// swiftformat:disable all
/// Extension on `[RadixProtocol<T>?]`
extension Collection where Element: SwiftRadixOptionalType,
                           Element.Wrapped: RadixProtocol {
    /// Returns an array of extracted values.
    @inlinable
    public var values: [Element.Wrapped.NumberType?] {
        map { $0.optional?.value }
    }
}
//swiftformat:enable all
