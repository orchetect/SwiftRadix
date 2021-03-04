//
//  Octal Type Extensions.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation

// MARK: - Constructors

extension BinaryInteger {
	
	/// Returns a new `Radix<T>` base-8 struct from an integer, preserving the integer type.
	@inline(__always) public var octal: Radix<Self> {
		
		Radix(self, base: 8)
		
	}
	
}

extension String {
	
	/// Returns a new `Radix<Int>?` base-8 struct from an octal string.
	@inlinable public var octal: Radix<Int>? {
		
		Radix(self, base: 8)
		
	}
	
	/// Returns a new `Radix<T>?` base-8 struct from a octal string.
	///
	/// Example usage:
	///
	/// ```
	/// "123".octal(as: Int16.self)
	/// ```
	@inlinable public func octal<T: BinaryInteger>(as type: T.Type) -> Radix<T>? {
		
		Radix<T>(self, base: 8)
		
	}
	
}

extension Array where Element == String {
	
	/// Returns an array of `Radix<Int>?` base-8 structs constructed from an array of octal strings.
	public var octal: [Radix<Int>?] {
		
		self.map { Radix<Int>($0, base: 8) }
		
	}
	
	/// Returns an array of `Radix<T>?` base-8 structs constructed from an array of octal strings.
	///
	/// Example usage:
	///
	/// ```
	/// ["47", "123"].octal(as: Int16.self)
	/// ```
	public func octal<T: BinaryInteger>(as type: T.Type) -> [Radix<T>?] {
		
		self.map { Radix<T>($0, base: 8) }
		
	}
	
}

extension Collection where Element: BinaryInteger {
	
	/// Returns an array of `Radix<T>` base-8 structs built from an integer array, preserving the integer type.
	@inlinable public var octal: [Radix<Element>] {
		
		self.map { Radix($0, base: 8) }
		
	}
	
}

extension Data {
	
	/// Returns an array of `Radix<UInt8>` base-8 structs built from Data bytes.
	public var octal: [Radix<UInt8>] {
		
		self.map { Radix($0, base: 8) }
		
	}
	
}
