//
//  Utilities.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//

import Foundation

// MARK: - OptionalType

// see for more info: https://stackoverflow.com/questions/50999688/swift-extension-on-sometypet-to-produce-t-possible
//
// Workaround useful to enable extensions on types such as `Struct<T>?` or `[Struct<T>?]`.
//
// ie:
//
//     extension Collection
//       where Element: SwiftRadixOptionalType,
//             Element.Wrapped: RadixProtocol
//     { ... }
//

public protocol SwiftRadixOptionalType {
    associatedtype Wrapped
    
    /// Return an object as an optional.
    var optional: Wrapped? { get }
}

extension Optional: SwiftRadixOptionalType {
    @inline(__always)
    public var optional: Wrapped? {
        self
    }
}

// MARK: - BinaryInteger

//swiftformat:disable all
extension BinaryInteger {
    /// Returns the value rounded up to multiples of a given value.
    ///
    /// Borrowed from OTCore 1.3.0: https://github.com/orchetect/OTCore (MIT license)
    @_disfavoredOverload
    internal func roundedUp(toMultiplesOf: Self) -> Self {
        if toMultiplesOf < 1 { return self }
        
        let source: Self = self >= 0 ? self : 0 - self
        
        let isNegative: Bool = self < 0
        
        let rem = source % toMultiplesOf
        
        let divisions = rem == 0
            ? self
            : self + (isNegative ? rem : toMultiplesOf - rem)
        
        return divisions
    }
}
//swiftformat:enable all

// MARK: - String

extension StringProtocol {
    /// Splits a string into groups of `length` characters, grouping from left-to-right.
    /// If `backwards` is true, right-to-left.
    ///
    /// Borrowed from OTCore 1.3.0: https://github.com/orchetect/OTCore (MIT license)
    @_disfavoredOverload
    internal func split(
        every: Int,
        backwards: Bool = false
    ) -> [SubSequence] {
        var result: [SubSequence] = []
        
        for i in stride(from: 0, to: count, by: every) {
            switch backwards {
            case true:
                let offsetEndIndex = index(endIndex, offsetBy: -i)
                let offsetStartIndex = index(
                    offsetEndIndex,
                    offsetBy: -every,
                    limitedBy: startIndex
                )
                ?? startIndex
                
                result.insert(self[offsetStartIndex ..< offsetEndIndex], at: 0)
                
            case false:
                let offsetStartIndex = index(startIndex, offsetBy: i)
                let offsetEndIndex = index(
                    offsetStartIndex,
                    offsetBy: every,
                    limitedBy: endIndex
                )
                ?? endIndex
                
                result.append(self[offsetStartIndex ..< offsetEndIndex])
            }
        }
        
        return result
    }
}
