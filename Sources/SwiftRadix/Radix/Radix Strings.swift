//
//  Radix Strings.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

extension Radix {
    /// Computed property:
    /// Getter returns radix String representation of `value` without prefix.
    /// Setter assigns `value` to value equivalent of radix String, if it is valid.
    public var stringValue: String {
        get {
            stringValue(prefix: false, uppercase: true)
        }
        
        set {
            guard let convertedValue = valueFrom(radixString: newValue)
            else { return }
            
            value = convertedValue
        }
    }
    
    /// Computed property:
    /// Returns radix String representation of `value`, optionally including `prefix`.
    public func stringValue(
        prefix: Bool,
        uppercase: Bool = true
    ) -> String {
        prefix
            ? stringPrefix + String(value, radix: base, uppercase: uppercase)
            : String(value, radix: base, uppercase: uppercase)
    }
    
    /// Computed property:
    /// Returns radix String representation of `value`, padding zeros to number of places passed.
    ///
    /// If `splitEvery` > 0, a spacer is inserted every nth characters in the resulting string; the
    /// spacer will be a space if `prefix` is false and an underscore if `prefix` is true.
    public func stringValue(
        padTo: Int,
        splitEvery: Int = 0,
        prefix: Bool = false,
        uppercase: Bool = true
    ) -> String {
        var radixString = stringValue(prefix: false, uppercase: uppercase)
        
        var padCount = (padTo - radixString.count)
        if padCount < 0 { padCount = 0 }
        
        if padCount > 0 {
            radixString = String(repeatElement("0", count: padCount)) + radixString
        }
        
        if splitEvery > 0 {
            let splitter = prefix ? "_" : " "
            
            radixString = radixString
                .split(every: splitEvery, backwards: true)
                .joined(separator: splitter)
        }
        
        return prefix
            ? stringPrefix + radixString
            : radixString
    }
    
    /// Computed property:
    /// Returns radix String representation of `value`, padded to multiples of specified number of
    /// characters.
    ///
    /// If `splitEvery` > 0, a space is inserted every nth characters in the resulting string; the
    /// spacer will be a space if `prefix` is false and an underscore if `prefix` is true.
    public func stringValue(
        padToEvery: Int,
        splitEvery: Int = 0,
        prefix: Bool = false,
        uppercase: Bool = true
    ) -> String {
        var radixString = stringValue(prefix: false, uppercase: uppercase)
        
        var padCount = radixString.count
            .roundedUp(toMultiplesOf: padToEvery) - radixString.count
        if padCount < 0 { padCount = 0 }
        
        if padCount > 0 {
            radixString = String(repeatElement("0", count: padCount)) + radixString
        }
        
        if splitEvery > 0 {
            let splitter = prefix ? "_" : " "
            
            radixString = radixString
                .split(every: splitEvery, backwards: true)
                .joined(separator: splitter)
        }
        
        return prefix
            ? stringPrefix + radixString
            : radixString
    }
}

// MARK: - Helpers

extension Radix {
    /// Internal function to convert a radix String to a value.
    /// Fails with nil if not successful or if the String is malformed.
    @usableFromInline
    internal func valueFrom<S: StringProtocol>(radixString: S) -> NumberType? {
        var parseString: String
        
        // treat string prefix as case-sensitive
        if radixString.starts(with: stringPrefix),
           stringPrefix != ""
        {
            parseString = String(radixString.dropFirst(2))
        } else {
            parseString = String(radixString)
        }
        
        var castValue: NumberType?
        
        switch NumberType.self {
        case is UInt.Type:
            // Handle UInt case separately, since it can overflow into Int(_: radix:)
            
            // fails if non-conformant to the radix (a malformed string)
            guard let convertedValue = UInt(parseString, radix: base)
            else { return nil }
            
            // nil if the number overflows the integer type
            castValue = NumberType(exactly: convertedValue)
            
        default:
            // fails if non-conformant to the radix (a malformed string)
            guard let convertedValue = Int(parseString, radix: base)
            else { return nil }
            
            // nil if the number overflows the integer type
            castValue = NumberType(exactly: convertedValue)
        }
        
        return castValue
    }
}
