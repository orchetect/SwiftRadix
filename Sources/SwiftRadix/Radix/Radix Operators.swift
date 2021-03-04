//
//  Radix Operators.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2017-12-29.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation


// MARK: - Equatable

extension Radix: Equatable {
	
	// also gives != for free
	@inlinable static public func == (lhs: Radix, rhs: Radix) -> Bool {
		lhs.value == rhs.value
	}
	
	@inlinable static public func == <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
		lhs.value == rhs
	}
	
	@inlinable static public func == <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
		lhs == rhs.value
	}
	
	@inlinable static public func != <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
		lhs.value != rhs
	}
	
	@inlinable static public func != <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
		lhs != rhs.value
	}
	
}


// MARK: - Equatable - Optionals

extension Radix {
	
	@inlinable static public func == (lhs: Radix?, rhs: Radix) -> Bool {
		lhs?.value == rhs.value
	}
	
	@inlinable static public func == (lhs: Radix, rhs: Radix?) -> Bool {
		lhs.value == rhs?.value
	}
	
}

@inlinable public func == <T: BinaryInteger, Other>(lhs: Radix<T>?, rhs: Other) -> Bool
where Other : BinaryInteger
{
	if lhs == nil { return false }
	return lhs!.value == rhs
}

@inlinable public func == <T: BinaryInteger, Other>(lhs: Other, rhs: Radix<T>?) -> Bool
where Other : BinaryInteger
{
	if rhs == nil { return false }
	return lhs == rhs!.value
}


@inlinable public func != <T: BinaryInteger, Other>(lhs: Radix<T>?, rhs: Other) -> Bool
where Other : BinaryInteger
{
	if lhs == nil { return false }
	return lhs!.value != rhs
}

@inlinable public func != <T: BinaryInteger, Other>(lhs: Other, rhs: Radix<T>?) -> Bool
where Other : BinaryInteger
{
	if rhs == nil { return false }
	return lhs != rhs!.value
}


// MARK: - Comparable

extension Radix: Comparable {
	
	@inlinable static public func > (lhs: Radix, rhs: Radix) -> Bool {
		lhs.value > rhs.value
	}
	
	@inlinable static public func > <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
		lhs.value > rhs
	}
	
	@inlinable static public func > <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
		lhs > rhs.value
	}
	
	@inlinable static public func < (lhs: Radix, rhs: Radix) -> Bool {
		lhs.value < rhs.value
	}
	
	@inlinable static public func < <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
		lhs.value < rhs
	}
	
	@inlinable static public func < <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
		lhs < rhs.value
	}
	
	@inlinable static public func >= (lhs: Radix, rhs: Radix) -> Bool {
		lhs.value >= rhs.value
	}
	
	@inlinable static public func >= <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
		lhs.value >= rhs
	}
	
	@inlinable static public func >= <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
		lhs >= rhs.value
	}
	
	@inlinable static public func <= (lhs: Radix, rhs: Radix) -> Bool {
		lhs.value <= rhs.value
	}
	
	@inlinable static public func <= <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
		lhs.value <= rhs
	}
	
	@inlinable static public func <= <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
		lhs <= rhs.value
	}
	
}


// MARK: - Math operators

@inlinable public func + <T>(lhs: Radix<T>, rhs: Radix<T>) -> Radix<T> {
	Radix<T>(lhs.value + rhs.value, base: lhs.base)
}

@inlinable public func + <T>(lhs: Radix<T>, rhs: T) -> Radix<T> {
	Radix<T>(lhs.value + rhs, base: lhs.base)
}

@inlinable public func + <T>(lhs: T, rhs: Radix<T>) -> T {
	lhs + rhs.value
}

@inlinable public func - <T>(lhs: Radix<T>, rhs: Radix<T>) -> Radix<T> {
	Radix<T>(lhs.value - rhs.value, base: lhs.base)
}

@inlinable public func - <T>(lhs: Radix<T>, rhs: T) -> Radix<T> {
	Radix<T>(lhs.value - rhs, base: lhs.base)
}

@inlinable public func - <T>(lhs: T, rhs: Radix<T>) -> T {
	lhs - rhs.value
}

@inlinable public func * <T>(lhs: Radix<T>, rhs: Radix<T>) -> Radix<T> {
	Radix<T>(lhs.value * rhs.value, base: lhs.base)
}

@inlinable public func * <T>(lhs: Radix<T>, rhs: T) -> Radix<T> {
	Radix<T>(lhs.value * rhs, base: lhs.base)
}

@inlinable public func * <T>(lhs: T, rhs: Radix<T>) -> T {
	lhs * rhs.value
}

@inlinable public func / <T>(lhs: Radix<T>, rhs: Radix<T>) -> Radix<T> {
	Radix<T>(lhs.value / rhs.value, base: lhs.base)
}

@inlinable public func / <T>(lhs: Radix<T>, rhs: T) -> Radix<T> {
	Radix<T>(lhs.value / rhs, base: lhs.base)
}

@inlinable public func / <T>(lhs: T, rhs: Radix<T>) -> T {
	lhs / rhs.value
}


// MARK: - Mutating math operators

@inlinable public func += <T>(lhs: inout Radix<T>, rhs: Radix<T>) {
	lhs.value += rhs.value
}

@inlinable public func += <T>(lhs: inout Radix<T>, rhs: T) {
	lhs.value += rhs
}

@inlinable public func +=< T>(lhs: inout T, rhs: Radix<T>) {
	lhs += rhs.value
}

@inlinable public func -= <T>(lhs: inout Radix<T>, rhs: Radix<T>) {
	lhs.value -= rhs.value
}

@inlinable public func -= <T>(lhs: inout Radix<T>, rhs: T) {
	lhs.value -= rhs
}

@inlinable public func -= <T>(lhs: inout T, rhs: Radix<T>) {
	lhs -= rhs.value
}

@inlinable public func *= <T>(lhs: inout Radix<T>, rhs: Radix<T>) {
	lhs.value *= rhs.value
}

@inlinable public func *=< T>(lhs: inout Radix<T>, rhs: T) {
	lhs.value *= rhs
}

@inlinable public func *= <T>(lhs: inout T, rhs: Radix<T>) {
	lhs *= rhs.value
}

@inlinable public func /= <T>(lhs: inout Radix<T>, rhs: Radix<T>) {
	lhs.value /= rhs.value
}

@inlinable public func /= <T>(lhs: inout Radix<T>, rhs: T) {
	lhs.value /= rhs
}

@inlinable public func /= <T>(lhs: inout T, rhs: Radix<T>) {
	lhs /= rhs.value
}


// MARK: Bitwise bit shift

extension Radix {
	
	@inlinable static public func >> <T>(lhs: Radix<T>, rhs: Radix) -> Radix<T> {
		Radix<T>(lhs.value >> rhs.value, base: lhs.base)
	}
	
	@inlinable static public func >> <T: BinaryInteger>(lhs: Radix, rhs: T) -> Radix {
		Radix(lhs.value >> rhs, base: lhs.base)
	}
	
	@inlinable static public func >> <T: BinaryInteger>(lhs: T, rhs: Radix) -> T {
		lhs >> rhs.value
	}
	
	@inlinable static public func << <T>(lhs: Radix<T>, rhs: Radix) -> Radix<T> {
		Radix<T>(lhs.value << rhs.value, base: lhs.base)
	}
	
	@inlinable static public func << <T: BinaryInteger>(lhs: Radix, rhs: T) -> Radix {
		Radix(lhs.value << rhs, base: lhs.base)
	}
	
	@inlinable static public func << <T: BinaryInteger>(lhs: T, rhs: Radix) -> T {
		lhs << rhs.value
	}

}


// MARK: Bitwise nibble shift

infix operator >>>>: BitwiseShiftPrecedence
infix operator <<<<: BitwiseShiftPrecedence

extension Radix {
	
	@inlinable static public func >>>> <T>(lhs: Radix<T>, rhs: Radix) -> Radix<T> {
		Radix<T>(lhs.value >> (rhs.value * 4), base: lhs.base)
	}
	
	@inlinable static public func >>>> <T: BinaryInteger>(lhs: Radix, rhs: T) -> Radix {
		Radix(lhs.value >> (rhs * 4), base: lhs.base)
	}
	
	@inlinable static public func >>>> <T: BinaryInteger>(lhs: T, rhs: Radix) -> T {
		lhs >> (rhs.value * 4)
	}
	
	@inlinable static public func <<<< <T>(lhs: Radix<T>, rhs: Radix) -> Radix<T> {
		Radix<T>(lhs.value << (rhs.value * 4), base: lhs.base)
	}
	
	@inlinable static public func <<<< <T: BinaryInteger>(lhs: Radix, rhs: T) -> Radix {
		Radix(lhs.value << (rhs * 4), base: lhs.base)
	}
	
	@inlinable static public func <<<< <T: BinaryInteger>(lhs: T, rhs: Radix) -> T {
		lhs << (rhs.value * 4)
	}
	
}


// MARK: Bitwise AND

extension Radix {
	
	@inlinable static public func & (lhs: Radix, rhs: Radix) -> Radix {
		Radix(lhs.value & rhs.value, base: lhs.base)
	}
	
	@inlinable static public func & <T: BinaryInteger>(lhs: Radix, rhs: T) -> Radix<T> {
		Radix<T>(T(lhs.value) & rhs, base: lhs.base)
	}
	
	@inlinable static public func & <T: BinaryInteger>(lhs: T, rhs: Radix) -> T {
		lhs & T(rhs.value)
	}
	
}
