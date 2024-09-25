//
//  Radix Collection Methods.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - .stringValue

extension Collection where Element: RadixProtocol {
    /// Convert an array of `Radix` to a concatenated `String` of radix string values.
    public var stringValue: String {
        map { $0.stringValue }
            .joined(separator: " ")
    }
    
    /// Convert an array of `Radix` to a concatenated `String` of radix string values, each value
    /// padded to the number of characters specified.
    public func stringValue(
        prefix: Bool = false,
        separator: String = " ",
        uppercase: Bool = true
    ) -> String {
        map { $0.stringValue(prefix: prefix, uppercase: uppercase) }
            .joined(separator: separator)
    }
    
    /// Convert an array of `Radix` to a concatenated `String` of radix string values, each value
    /// padded to the number of characters specified.
    public func stringValue(
        padTo: Int,
        prefix: Bool = false,
        separator: String = " ",
        uppercase: Bool = true
    ) -> String {
        map {
            $0.stringValue(
                padTo: padTo,
                splitEvery: 0,
                prefix: prefix,
                uppercase: uppercase
            )
        }
        .joined(separator: separator)
    }
    
    /// Convert an array of `Radix` to a concatenated `String` of radix string values, each value
    /// padded to multiples of the number of characters specified.
    public func stringValue(
        padToEvery: Int,
        prefix: Bool = false,
        separator: String = " ",
        uppercase: Bool = true
    ) -> String {
        map {
            $0.stringValue(
                padToEvery: padToEvery,
                splitEvery: 0,
                prefix: prefix,
                uppercase: uppercase
            )
        }
        .joined(separator: separator)
    }
}

// MARK: - .stringValueArrayLiteral

extension Collection where Element: RadixProtocol {
    /// Format an array of `Radix` as a Swift array literal, useful for generating Swift array
    /// declarations.
    public var stringValueArrayLiteral: String {
        stringValueArrayLiteral(padToEvery: 0)
    }
    
    /// Format an array of `Radix` as a Swift array literal, useful for generating Swift array
    /// declarations, each value padded to the number of characters specified.
    public func stringValueArrayLiteral(
        padTo: Int,
        uppercase: Bool = true
    ) -> String {
        "[" + stringValue(padTo: padTo, prefix: true, separator: ", ", uppercase: uppercase) + "]"
    }
    
    /// Format an array of `Radix` as a Swift array literal, useful for generating Swift array
    /// declarations, each value padded to multiples of the number of characters specified.
    public func stringValueArrayLiteral(
        padToEvery: Int,
        uppercase: Bool = true
    ) -> String {
        "[" +
            stringValue(
                padToEvery: padToEvery,
                prefix: true,
                separator: ", ",
                uppercase: uppercase
            ) + "]"
    }
}

// MARK: - .stringValues

extension Collection where Element: RadixProtocol {
    /// Convert an array of `Radix` to an array of radix string values without padding.
    public var stringValues: [String] {
        stringValues(padTo: 0)
    }
    
    /// Convert an array of `Radix` to an array of radix string values, each value padded to the
    /// number of characters specified.
    public func stringValues(
        padTo: Int,
        prefixes: Bool = false,
        uppercase: Bool = true
    ) -> [String] {
        map {
            $0.stringValue(
                padTo: padTo,
                splitEvery: 0,
                prefix: prefixes,
                uppercase: uppercase
            )
        }
    }
    
    /// Convert an array of `Radix` to an array of radix string values, each value padded to
    /// multiples of the number of characters specified.
    public func stringValues(
        padToEvery: Int,
        prefixes: Bool = false,
        uppercase: Bool = true
    ) -> [String] {
        map {
            $0.stringValue(
                padToEvery: padToEvery,
                splitEvery: 0,
                prefix: prefixes,
                uppercase: uppercase
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
