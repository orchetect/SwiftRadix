//
//  Octal.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation

/// Convenience constructor for `Radix<T>` with a radix of 8 (octal).
@inlinable public func Octal<T: BinaryInteger>(_ number: T) -> Radix<T> {
	
	Radix<T>(number, base: 8)
	
}

/// Convenience constructor for `Radix<Int>` with a radix of 8 (octal).
@inlinable public func Octal(_ string: String) -> Radix<Int>? {

	Radix<Int>(string, base: 8)

}

/// Convenience constructor for `Radix<T>` with a radix of 8 (octal).
///
/// Example usage:
///
/// ```
/// Octal("123", as: Int16.self)
/// ```
@inlinable public func Octal<T: BinaryInteger>(_ string: String, as type: T.Type) -> Radix<T>? {
	
	Radix<T>(string, base: 8)
	
}
