//
//  Radix Collection Methods.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2017-12-29.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation


// MARK: - .stringValue

extension Collection where Element : RadixProtocol {

	/// Convert an array of `Radix` to a concatenated String of radix string values.
	public var stringValue: String {
		
		self
			.map { $0.stringValue }
			.joined(separator: " ")

	}
	
	/// Convert an array of `Radix` to a concatenated String of radix string values, each value padded to the number of characters specified.
	public func stringValue(prefix: Bool) -> String {
		
		self
			.map { $0.stringValue(prefix: prefix) }
			.joined(separator: " ")

	}
	
	/// Convert an array of `Radix` to a concatenated String of radix string values, each value padded to the number of characters specified.
	public func stringValue(padTo: Int,
							prefix: Bool = false) -> String {
		
		self
			.map { $0.stringValue(padTo: padTo,
								  splitEvery: 0,
								  prefix: prefix) }
			.joined(separator: " ")

	}

	/// Convert an array of `Radix` to a concatenated String of radix string values, each value padded to multiples of the number of characters specified.
	public func stringValue(padToEvery: Int,
							prefix: Bool = false) -> String {
		
		self
			.map { $0.stringValue(padToEvery: padToEvery,
								  splitEvery: 0,
								  prefix: prefix) }
			.joined(separator: " ")
		
	}
	
}


// MARK: - .stringValueArrayLiteral

extension Collection where Element : RadixProtocol {
	
	/// Convert an array of `Radix` to a Swift array literal, useful for generating Swift array declarations.
	public var stringValueArrayLiteral: String {

		stringValueArrayLiteral(padToEvery: 0)

	}
	
	/// Convert an array of `Radix` to a Swift array literal, useful for generating Swift array declarations, each value padded to the number of characters specified.
	public func stringValueArrayLiteral(padTo: Int) -> String {

		"["
			+ self.stringValues(padTo: padTo, prefixes: true)
			.joined(separator: ", " )
			+ "]"

	}
	
	/// Convert an array of `Radix` to a Swift array literal, useful for generating Swift array declarations, each value padded to multiples of the number of characters specified.
	public func stringValueArrayLiteral(padToEvery: Int) -> String {

		"["
			+ self.stringValues(padToEvery: padToEvery, prefixes: true)
			.joined(separator: ", " )
			+ "]"

	}

}


// MARK: - .stringValues

extension Collection where Element : RadixProtocol {

	/// Convert an array of `Radix` to an Array of radix string values.
	public var stringValues: [String] {

		self.stringValues(padTo: 0)

	}

	/// Convert an array of `Radix` to an Array of radix string values, each value padded to the number of characters specified.
	public func stringValues(padTo: Int,
							 prefixes: Bool = false) -> [String] {

		self.map { $0.stringValue(padTo: padTo,
								  splitEvery: 0,
								  prefix: prefixes) }

	}

	/// Convert an array of `Radix` to an Array of radix string values, each value padded to multiples of the number of characters specified.
	public func stringValues(padToEvery: Int,
							 prefixes: Bool = false) -> [String] {

		self.map { $0.stringValue(padToEvery: padToEvery,
								  splitEvery: 0,
								  prefix: prefixes) }

	}

}


// MARK: - .values

/// Extension on [RadixProtocol<T>]
extension Collection where Element : RadixProtocol {
	
	/// Returns an array of extracted values.
	@inlinable public var values: [Element.NumberType] {
		
		self.map { $0.value }
		
	}
	
}

/// Extension on [RadixProtocol<T>?]
extension Collection where Element: OptionalType, Element.Wrapped : RadixProtocol {
	
	/// Returns an array of extracted values.
	@inlinable public var values: [Element.Wrapped.NumberType?] {
		
		self.map { $0.optional?.value }
		
	}
	
}
