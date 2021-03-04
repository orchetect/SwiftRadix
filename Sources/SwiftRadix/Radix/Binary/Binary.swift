//
//  Binary.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation

/// Convenience constructor for `Radix<T>` with a radix of 2 (binary).
@inlinable public func Binary<T: BinaryInteger>(_ number: T) -> Radix<T> {
	
	Radix<T>(number, base: 2)
	
}

/// Convenience constructor for `Radix<Int>` with a radix of 2 (binary).
@inlinable public func Binary(_ string: String) -> Radix<Int>? {

	Radix<Int>(string, base: 2)

}

/// Convenience constructor for `Radix<T>` with a radix of 2 (binary).
///
/// Example usage:
///
/// ```
/// Binary("1010", as: Int16.self)
/// ```
@inlinable public func Binary<T: BinaryInteger>(_ string: String, as type: T.Type) -> Radix<T>? {
	
	Radix<T>(string, base: 2)
	
}
