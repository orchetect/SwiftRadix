//
//  Radix.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - Radix<T>

/// A lightweight type useful for translating integers to radix strings and vice-versa, with a suite
/// of convenient constructors and accessors.
public struct Radix<T: BinaryInteger>: RadixProtocol {
    // MARK: - Base Properties
    
    /// Stored value type
    public typealias NumberType = T
    
    /// Stored value
    public var value: NumberType = 0
    
    /// Base (radix)
    public var base: Int
    
    /// String prefix specific to the radix
    @inline(__always)
    public var stringPrefix: String {
        switch base {
        case 2:  return "0b"
        case 8:  return "0o"
        case 16: return "0x"
        default: return ""
        }
    }
    
    // MARK: - Constructors
    
    /// Construct from a number, preserving the number's type in `value` variable.
    ///
    /// Valid radix is between 2 and 36.
    ///
    /// Note: convenience methods exist for common radices:
    ///
    ///     Binary(0b1100)
    ///     0b1100.binary
    ///
    ///     Octal(0o123)
    ///     0o123.octal
    ///
    ///     Hex(0xFF)
    ///     0xFF.hex
    ///
    @inline(__always)
    public init?(
        _ number: NumberType,
        base: Int
    ) {
        // radix validity check
        if base < 2 || base > 36 { return nil }
        
        self.base = base
        
        value = number
    }
    
    /// Internal initializer that bypasses base range validation.
    @inline(__always) @usableFromInline
    internal init(
        _ number: NumberType,
        unsafeBase: Int
    ) {
        base = unsafeBase
        
        value = number
    }
    
    /// Construct from a radix string.
    ///
    /// Valid radix is between 2 and 36.
    ///
    /// ie:
    ///
    ///     // Binary:
    ///     Radix("1100", radix: 2)
    ///     Radix("0b1100", radix: 2)
    ///
    ///     // Octal:
    ///     Radix("12345670", radix: 8)
    ///     Radix("0o12345670", radix: 8)
    ///
    ///     // Hex:
    ///     Radix("FF", radix: 16)
    ///     Radix("0xFF", radix: 16)
    ///
    /// Stores `value` as `Int` type by default.
    ///
    /// To specify number type:
    ///
    ///     Radix<UInt8>("FF", radix: 16)
    ///     Radix<UInt16>("97FE", radix: 16)
    ///
    /// Note: convenience methods also exist for common radices:
    ///
    ///     Binary("1100")
    ///     "1100".binary
    ///
    ///     Octal("123")
    ///     "123".octal
    ///
    ///     Hex("FF")
    ///     "FF".hex
    ///
    @inlinable
    public init?<S: StringProtocol>(
        _ string: S,
        base: Int
    ) {
        // radix validity check
        if base < 2 || base > 36 { return nil }
        
        self.base = base
        
        guard let convertedValue = valueFrom(radixString: string)
        else { return nil }
        
        value = convertedValue
    }
}
