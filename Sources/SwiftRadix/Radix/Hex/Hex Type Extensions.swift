//
//  Hex Type Extensions.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation

fileprivate let localRadix = 16

// MARK: - Constructors

extension BinaryInteger {
	
	/// Returns a new `Radix<T>` base-16 struct from an integer, preserving the integer type.
	public var hex: Radix<Self> {
		
		Radix(self, base: localRadix)
		
	}
	
}

extension String {
	
	/// Returns a new `Radix<Int>?` base-16 struct from a hex string.
	public var hex: Radix<Int>? {
		
		Radix(self, base: localRadix)
		
	}
	
	/// Returns a new `Radix<T>?` base-16 struct from a hex string.
	///
	/// Example usage:
	///
	/// ```
	/// "FF".hex(as: Int16.self)
	/// ```
	public func hex<T: BinaryInteger>(as type: T.Type) -> Radix<T>? {
		
		Radix<T>(self, base: localRadix)
		
	}
	
}

extension Array where Element == String {
	
	/// Returns an array of `Radix<Int>?` base-16 structs constructed from an array of hex strings.
	public var hex: [Radix<Int>?] {
		
		self.map( { Radix<Int>($0, base: localRadix) })
		
	}
	
	/// Returns an array of `Radix<T>` base-16 structs constructed from an array of hex strings.
	///
	/// Example usage:
	///
	/// ```
	/// ["0F", "FF"].hex(as: Int16.self)
	/// ```
	public func hex<T: BinaryInteger>(as type: T.Type) -> [Radix<T>?] {
		
		self.map( { Radix<T>($0, base: localRadix) })
		
	}
	
}

extension Collection where Element: BinaryInteger {
	
	/// Returns an array of `Radix<T>` base-16 structs built from an integer array, preserving the integer type.
	public var hex: [Radix<Element>] {
		
		self.map( { Radix($0, base: localRadix) })
		
	}
	
}

extension Data {
	
	/// Returns an array of `Radix<UInt8>` base-16 structs built from Data bytes.
	public var hex: [Radix<UInt8>] {
		
		self.map( { Radix($0, base: localRadix) })
		
	}
	
}
