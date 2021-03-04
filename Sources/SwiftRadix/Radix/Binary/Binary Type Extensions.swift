//
//  Binary Type Extensions.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation

// MARK: - Constructors

extension BinaryInteger {
	
	/// Returns a new `Radix<T>` base-2 struct from an integer, preserving the integer type.
	@inline(__always) public var binary: Radix<Self> {
		
		Radix(self, base: 2)
		
	}
	
}

extension String {
	
	/// Returns a new `Radix<Int>?` base-2 struct from a binary string.
	@inlinable public var binary: Radix<Int>? {
		
		Radix(self, base: 2)
		
	}
	
	/// Returns a new `Radix<T>?` base-2 struct from a binary string.
	///
	/// Example usage:
	///
	/// ```
	/// "1010".binary(as: Int16.self)
	/// ```
	@inlinable public func binary<T: BinaryInteger>(as type: T.Type) -> Radix<T>? {
		
		Radix<T>(self, base: 2)
		
	}
	
}

extension Array where Element == String {
	
	/// Returns an array of `Radix<Int>?` base-2 structs constructed from an array of binary strings.
	public var binary: [Radix<Int>?] {
		
		self.map { Radix<Int>($0, base: 2) }
		
	}
	
	/// Returns an array of `Radix<T>?` base-2 structs constructed from an array of binary strings.
	///
	/// Example usage:
	///
	/// ```
	/// ["1010", "1111"].binary(as: Int16.self)
	/// ```
	public func binary<T: BinaryInteger>(as type: T.Type) -> [Radix<T>?] {
		
		self.map { Radix<T>($0, base: 2) }
		
	}
	
}

extension Collection where Element: BinaryInteger {
	
	/// Returns an array of `Radix<T>` base-2 structs built from an integer array, preserving the integer type.
	@inlinable public var binary: [Radix<Element>] {
		
		self.map { Radix($0, base: 2) }
		
	}
	
}

extension Data {
	
	/// Returns an array of `Radix<UInt8>` base-2 structs built from Data bytes.
	public var binary: [Radix<UInt8>] {
		
		self.map { Radix($0, base: 2) }
		
	}
	
}
