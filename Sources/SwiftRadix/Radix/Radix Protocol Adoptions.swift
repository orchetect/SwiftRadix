//
//  Radix Protocol Adoptions.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: String Convertible

// swiftformat:disable all
extension Radix: CustomStringConvertible,
                 CustomDebugStringConvertible {
    public var description: String {
        stringValue(prefix: true)
    }
    
    public var debugDescription: String {
        "Radix<\(String(describing: NumberType.self))>(\(stringPrefix)\(stringValue))"
    }
}
//swiftformat:enable all

// MARK: Hashable

extension Radix: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
