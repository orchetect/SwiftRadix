//
//  RadixProtocol.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import Foundation

// Protocol is necessary in order to create associatedtype-erased extensions
// ie:
// extension Collection where Element: RadixProtocol { }

/// Protocol used by SwiftRadix to facilitate extensions.
public protocol RadixProtocol {
    associatedtype NumberType: BinaryInteger
    
    var value: NumberType { get set }
    
    var stringPrefix: String { get }
    var base: Int { get set }
    
    init?(_ number: NumberType, base: Int)
    init?<S: StringProtocol>(_ string: S, base: Int)
    
    var stringValue: String { get set }
    func stringValue(prefix: Bool) -> String
    func stringValue(padTo: Int, splitEvery: Int, prefix: Bool) -> String
    func stringValue(padToEvery: Int, splitEvery: Int, prefix: Bool) -> String
}
