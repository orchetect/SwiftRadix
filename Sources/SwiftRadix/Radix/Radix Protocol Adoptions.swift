//
//  Radix Protocol Adoptions.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//

import Foundation

// MARK: String Convertible

//swiftformat:disable all
extension Radix: CustomStringConvertible,
                 CustomDebugStringConvertible {
    public var description: String {
        "Radix<\(String(describing: NumberType.self))>(\(stringPrefix)\(stringValue))"
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
