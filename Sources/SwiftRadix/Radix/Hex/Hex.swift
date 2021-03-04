//
//  Hex.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation

/// Convenience constructor for `Radix<T>` with a radix of 16 (hex).
@inlinable public func Hex<T: BinaryInteger>(_ number: T) -> Radix<T> {
	
	Radix<T>(number, base: 16)
	
}

/// Convenience constructor for `Radix<Int>` with a radix of 16 (hex).
@inlinable public func Hex(_ string: String) -> Radix<Int>? {

	Radix<Int>(string, base: 16)

}

/// Convenience constructor for `Radix<T>` with a radix of 16 (hex).
///
/// Example usage:
///
/// ```
/// Hex("FF", as: Int16.self)
/// ```
@inlinable public func Hex<T: BinaryInteger>(_ string: String, as type: T.Type) -> Radix<T>? {
	
	Radix<T>(string, base: 16)
	
}
