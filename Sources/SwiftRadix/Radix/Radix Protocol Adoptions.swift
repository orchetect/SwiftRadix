//
//  Radix Protocol Adoptions.swift
//  swift-radix • https://github.com/orchetect/swift-radix
//  © 2026 Steffan Andrews • Licensed under MIT License
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
// swiftformat:enable all

// MARK: Hashable

extension Radix: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
