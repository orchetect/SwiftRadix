//
//  Hex Protocols.swift
//  SwiftHex
//
//  Created by Steffan Andrews on 2017-12-29.
//  MIT License
//  https://github.com/orchetect/SwiftHex
//

import Foundation

// MARK: Protocols

/// Protocol adopted by `Hex<BinaryInteger>`
public protocol HexStringRepresentable: CustomStringConvertible, CustomDebugStringConvertible {
	associatedtype NumberType
	
	var value: NumberType { get set }
	
	var stringValue: String { get set }
	func stringValue(padTo: Int, withPrefix: Bool) -> String
	func stringValue(padToEvery: Int, withPrefix: Bool) -> String
}

// MARK: String Convertible

extension HexStringRepresentable {
	public var description: String { return "Hex<\(String(describing: NumberType.self))>(0x\(stringValue))" }
	public var debugDescription: String { return "Hex<\(String(describing: NumberType.self))>(0x\(stringValue))" }
}
