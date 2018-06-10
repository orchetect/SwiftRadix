//
//  Swift Extensions.swift
//  SwiftHex
//
//  Created by Steffan Andrews on 2017-12-29.
//  MIT License
//  https://github.com/orchetect/SwiftHex
//

import Foundation

extension BinaryInteger {
	/// Returns a new `Hex` struct from an integer, preserving the integer type.
	public var hex: Hex<Self> {
		return Hex(self)
	}
	
	/// Rounds an integer up to nearest evenly-divisible number. Works on negative integers too.
	public func roundedUp(divisibleBy: Self) -> Self {
		let source: Self = self >= 0 ? self : 0 - self
		let isNegative: Bool = self < 0
		
		let rem = source % divisibleBy
		let divisions = rem == 0 ? source : source + divisibleBy - rem
		return isNegative ? 0 - divisions : divisions
	}
}

extension String {
	/// Returns a new `Hex` struct from a hex string, defaulting to storing its value as Int type.
	public var hex: Hex<Int>? {
		return Hex(self)
	}
}

extension Array where Element == String {
	/// Returns an array of `Hex` structs built from an array of hex strings, defaulting to storing its value as Int type.
	public var hex: [Hex<Int>?] {
		return self.map( { Hex($0) })
	}
}

extension Collection where Element: BinaryInteger {
	/// Returns an array of `Hex` structs built from an integer array, preserving the integer type.
	public var hex: [Hex<Element>] {
		return self.map( { Hex($0) })
	}
}

extension Collection where Element: HexStringRepresentable {
	/// Returns an array of values extracted from an array of `Hex` structs.
	public var values: [Element.NumberType] {
		return self.map( { $0.value })
	}
	
	/// Convert an array of `Hex` to a concatenated String of hex string values, each value padded to two characters by default.
	public var stringValue: String {
		return self.stringValue(padTo: 2)
	}
	/// Convert an array of `Hex` to a concatenated String of hex string values, each value padded to the number of characters specified in `pad`.
	public func stringValue(padTo: Int) -> String {
		//return self.reduce("[", { String($0) + $1.stringValue + " " }).trimmingCharacters(in: CharacterSet(charactersIn: " ")) + "]"
		return self.reduce("", { String($0) + $1.stringValue(padTo: padTo) + " " }).trimmingCharacters(in: CharacterSet(charactersIn: " "))
	}
	/// Convert an array of `Hex` to a concatenated String of hex string values, each value padded to two characters or multiples of the number of characters specified in `padEvery`.
	public func stringValue(padToEvery: Int = 2) -> String {
		//return self.reduce("[", { String($0) + $1.stringValue + " " }).trimmingCharacters(in: CharacterSet(charactersIn: " ")) + "]"
		return self.reduce("", { String($0) + $1.stringValue(padToEvery: padToEvery) + " " }).trimmingCharacters(in: CharacterSet(charactersIn: " "))
	}
	
	/// Convert an array of `Hex` to an Array of hex string values, each padded to two characters by default.
	public var stringValues: [String] {
		return self.stringValues(padTo: 2)
	}
	/// Convert an array of `Hex` to an Array of hex string values, each padded to two characters the number of characters specified in `pad`.
	public func stringValues(padTo: Int = 2) -> [String] {
		return self.map( { $0.stringValue(padTo: padTo) } )
	}
	/// Convert an array of `Hex` to an Array of hex string values, each value padded to two characters or multiples of the number of characters specified in `padEvery`.
	public func stringValues(padToEvery: Int = 2) -> [String] {
		return self.map( { $0.stringValue(padToEvery: padToEvery) } )
	}

}

