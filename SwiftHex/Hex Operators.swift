//
//  Hex Operators.swift
//  SwiftHex
//
//  Created by Steffan Andrews on 2017-12-29.
//  MIT License
//  https://github.com/orchetect/SwiftHex
//

import Foundation

// MARK: Equatable

extension Hex: Equatable {
	// also gives != for free
	static public func ==(lhs: Hex, rhs: Hex) -> Bool {
		return lhs.value == rhs.value
	}
	static func ==<U: BinaryInteger>(lhs: Hex, rhs: U) -> Bool {
		return lhs.value == rhs
	}
	static func ==<U: BinaryInteger>(lhs: U, rhs: Hex) -> Bool {
		return lhs == rhs.value
	}
	static func !=<U: BinaryInteger>(lhs: Hex, rhs: U) -> Bool {
		return lhs.value != rhs
	}
	static func !=<U: BinaryInteger>(lhs: U, rhs: Hex) -> Bool {
		return lhs != rhs.value
	}
}

// MARK: Comparable

extension Hex: Comparable {
	static public func >(lhs: Hex, rhs: Hex) -> Bool {
		return lhs.value > rhs.value
	}
	static public func ><U: BinaryInteger>(lhs: Hex, rhs: U) -> Bool {
		return lhs.value > rhs
	}
	static public func ><U: BinaryInteger>(lhs: U, rhs: Hex) -> Bool {
		return lhs > rhs.value
	}
	
	static public func <(lhs: Hex, rhs: Hex) -> Bool {
		return lhs.value < rhs.value
	}
	static public func <<U: BinaryInteger>(lhs: Hex, rhs: U) -> Bool {
		return lhs.value < rhs
	}
	static public func <<U: BinaryInteger>(lhs: U, rhs: Hex) -> Bool {
		return lhs < rhs.value
	}
	
	static public func >=(lhs: Hex, rhs: Hex) -> Bool {
		return lhs.value >= rhs.value
	}
	static public func >=<U: BinaryInteger>(lhs: Hex, rhs: U) -> Bool {
		return lhs.value >= rhs
	}
	static public func >=<U: BinaryInteger>(lhs: U, rhs: Hex) -> Bool {
		return lhs >= rhs.value
	}
	
	static public func <=(lhs: Hex, rhs: Hex) -> Bool {
		return lhs.value <= rhs.value
	}
	static public func <=<U: BinaryInteger>(lhs: Hex, rhs: U) -> Bool {
		return lhs.value <= rhs
	}
	static public func <=<U: BinaryInteger>(lhs: U, rhs: Hex) -> Bool {
		return lhs <= rhs.value
	}
}

// MARK: Math operators

public func +<T>(lhs: Hex<T>, rhs: Hex<T>) -> Hex<T> {
	return Hex<T>(lhs.value + rhs.value)
}
public func +<T>(lhs: Hex<T>, rhs: T) -> Hex<T> {
	return Hex<T>(lhs.value + rhs)
}
public func +<T>(lhs: T, rhs: Hex<T>) -> Hex<T> {
	return Hex<T>(lhs + rhs.value)
}

public func -<T>(lhs: Hex<T>, rhs: Hex<T>) -> Hex<T> {
	return Hex<T>(lhs.value - rhs.value)
}
public func -<T>(lhs: Hex<T>, rhs: T) -> Hex<T> {
	return Hex<T>(lhs.value - rhs)
}
public func -<T>(lhs: T, rhs: Hex<T>) -> Hex<T> {
	return Hex<T>(lhs - rhs.value)
}

public func *<T>(lhs: Hex<T>, rhs: Hex<T>) -> Hex<T> {
	return Hex<T>(lhs.value * rhs.value)
}
public func *<T>(lhs: Hex<T>, rhs: T) -> Hex<T> {
	return Hex<T>(lhs.value * rhs)
}
public func *<T>(lhs: T, rhs: Hex<T>) -> Hex<T> {
	return Hex<T>(lhs * rhs.value)
}

public func /<T>(lhs: Hex<T>, rhs: Hex<T>) -> Hex<T> {
	return Hex<T>(lhs.value / rhs.value)
}
public func /<T>(lhs: Hex<T>, rhs: T) -> Hex<T> {
	return Hex<T>(lhs.value / rhs)
}
public func /<T>(lhs: T, rhs: Hex<T>) -> Hex<T> {
	return Hex<T>(lhs / rhs.value)
}

public func +=<T>(lhs: inout Hex<T>, rhs: Hex<T>) {
	lhs.value += rhs.value
}
public func +=<T>(lhs: inout Hex<T>, rhs: T) {
	lhs.value += rhs
}
public func +=<T>(lhs: inout T, rhs: Hex<T>) {
	lhs += rhs.value
}

public func -=<T>(lhs: inout Hex<T>, rhs: Hex<T>) {
	lhs.value -= rhs.value
}
public func -=<T>(lhs: inout Hex<T>, rhs: T) {
	lhs.value -= rhs
}
public func -=<T>(lhs: inout T, rhs: Hex<T>) {
	lhs -= rhs.value
}

public func *=<T>(lhs: inout Hex<T>, rhs: Hex<T>) {
	lhs.value *= rhs.value
}
public func *=<T>(lhs: inout Hex<T>, rhs: T) {
	lhs.value *= rhs
}
public func *=<T>(lhs: inout T, rhs: Hex<T>) {
	lhs *= rhs.value
}

public func /=<T>(lhs: inout Hex<T>, rhs: Hex<T>) {
	lhs.value /= rhs.value
}
public func /=<T>(lhs: inout Hex<T>, rhs: T) {
	lhs.value /= rhs
}
public func /=<T>(lhs: inout T, rhs: Hex<T>) {
	lhs /= rhs.value
}

// MARK: Bitwise operators

extension Hex {
	static public func >>(lhs: Hex, rhs: Hex) -> Hex {
		return Hex(lhs.value >> (rhs.value * 4))							// shift base-16 places
	}
	static public func >><U: BinaryInteger>(lhs: Hex, rhs: U) -> Hex {
		return Hex(lhs.value >> (rhs * 4))									// shift base-16 places
	}
	static public func >><U: BinaryInteger>(lhs: U, rhs: Hex) -> U {
		return lhs >> rhs.value												// shift default bitwise
	}
	
	static public func <<(lhs: Hex, rhs: Hex) -> Hex {
		return Hex(lhs.value << (rhs.value * 4))							// shift base-16 places
	}
	static public func <<<U: BinaryInteger>(lhs: Hex, rhs: U) -> Hex {
		return Hex(lhs.value << (rhs * 4))									// shift base-16 places
	}
	static public func <<<U: BinaryInteger>(lhs: U, rhs: Hex) -> U {
		return lhs << rhs.value												// shift default bitwise
	}
	
	static public func &(lhs: Hex, rhs: Hex) -> Hex {
		return Hex(lhs.value & rhs.value)									// filter mask: 0x0F, 0xF0, 0xFF, etc.
	}
	static public func &<U: BinaryInteger>(lhs: Hex, rhs: U) -> Hex {
		return Hex(lhs.value & T(rhs))										// filter mask: 0x0F, 0xF0, 0xFF, etc.
	}
	static public func &<T: BinaryInteger, U>(lhs: T, rhs: Hex<U>) -> T {
		return lhs & T(rhs.value)											// filter mask: 0x0F, 0xF0, 0xFF, etc.
	}
}

