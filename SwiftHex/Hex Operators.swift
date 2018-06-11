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

infix operator >>>>: BitwiseShiftPrecedence
infix operator <<<<: BitwiseShiftPrecedence

extension Hex {

	// nibble bit shift (4 binary places)
	
	static public func >>>>(lhs: Hex, rhs: Hex) -> Hex {
		return Hex(lhs.value >> (rhs.value * 4))							// nibble shift - multiples of 4 bits
	}
	static public func >>>><U: BinaryInteger>(lhs: Hex, rhs: U) -> Hex {
		return Hex(lhs.value >> (rhs * 4))									// nibble shift - multiples of 4 bits
	}
	static public func >>>><U: BinaryInteger>(lhs: U, rhs: Hex) -> Hex<U> {
		return Hex<U>(lhs >> (rhs.value * 4))								// nibble shift - multiples of 4 bits
	}
	
	static public func <<<<(lhs: Hex, rhs: Hex) -> Hex {
		return Hex(lhs.value << (rhs.value * 4))							// nibble shift - multiples of 4 bits
	}
	static public func <<<<<U: BinaryInteger>(lhs: Hex, rhs: U) -> Hex {
		return Hex(lhs.value << (rhs * 4))									// nibble shift - multiples of 4 bits
	}
	static public func <<<<<U: BinaryInteger>(lhs: U, rhs: Hex) -> Hex<U> {
		return Hex<U>(lhs << (rhs.value * 4))								// nibble shift - multiples of 4 bits
	}
	
	// bitshift left / right
	
	static public func >>(lhs: Hex, rhs: Hex) -> Hex {
		return Hex(lhs.value >> rhs.value)									// traditional bit shift
	}
	static public func >><U: BinaryInteger>(lhs: Hex, rhs: U) -> Hex {
		return Hex(lhs.value >> rhs)										// traditional bit shift
	}
	static public func >><U: BinaryInteger>(lhs: U, rhs: Hex) -> U {
		return lhs >> rhs.value												// traditional bit shift
	}
	
	static public func <<(lhs: Hex, rhs: Hex) -> Hex {
		return Hex(lhs.value << rhs.value)									// traditional bit shift
	}
	static public func <<<U: BinaryInteger>(lhs: Hex, rhs: U) -> Hex {
		return Hex(lhs.value << rhs)										// traditional bit shift
	}
	static public func <<<U: BinaryInteger>(lhs: U, rhs: Hex) -> U {
		return lhs << rhs.value												// traditional bit shift
	}
	
	// bitshift &
	
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

