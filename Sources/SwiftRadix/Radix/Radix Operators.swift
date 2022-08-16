//
//  Radix Operators.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - Equatable

extension Radix: Equatable {
    // also gives != for free
    @inlinable
    public static func == (lhs: Radix, rhs: Radix) -> Bool {
        lhs.value == rhs.value
    }
    
    @inlinable
    public static func == <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
        lhs.value == rhs
    }
    
    @inlinable
    public static func == <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
        lhs == rhs.value
    }
    
    @inlinable
    public static func != <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
        lhs.value != rhs
    }
    
    @inlinable
    public static func != <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
        lhs != rhs.value
    }
}

// MARK: - Equatable - Optionals

extension Radix {
    @inlinable
    public static func == (lhs: Radix?, rhs: Radix) -> Bool {
        lhs?.value == rhs.value
    }
    
    @inlinable
    public static func == (lhs: Radix, rhs: Radix?) -> Bool {
        lhs.value == rhs?.value
    }
}

@inlinable
public func == <
    T: BinaryInteger,
    O: BinaryInteger
>(lhs: Radix<T>?, rhs: O) -> Bool {
    guard let lhs = lhs else { return false }
    return lhs.value == rhs
}

@inlinable
public func == <
    T: BinaryInteger,
    O: BinaryInteger
>(lhs: O, rhs: Radix<T>?) -> Bool {
    guard let rhs = rhs else { return false }
    return lhs == rhs.value
}

@inlinable
public func != <
    T: BinaryInteger,
    O: BinaryInteger
>(
    lhs: Radix<T>?, rhs: O
) -> Bool {
    guard let lhs = lhs else { return false }
    return lhs.value != rhs
}

@inlinable
public func != <
    T: BinaryInteger,
    O: BinaryInteger
>(
    lhs: O, rhs: Radix<T>?
) -> Bool {
    guard let rhs = rhs else { return false }
    return lhs != rhs.value
}

// MARK: - Comparable

extension Radix: Comparable {
    @inlinable
    public static func > (lhs: Radix, rhs: Radix) -> Bool {
        lhs.value > rhs.value
    }
    
    @inlinable
    public static func > <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
        lhs.value > rhs
    }
    
    @inlinable
    public static func > <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
        lhs > rhs.value
    }
    
    @inlinable
    public static func < (lhs: Radix, rhs: Radix) -> Bool {
        lhs.value < rhs.value
    }
    
    @inlinable
    public static func < <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
        lhs.value < rhs
    }
    
    @inlinable
    public static func < <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
        lhs < rhs.value
    }
    
    @inlinable
    public static func >= (lhs: Radix, rhs: Radix) -> Bool {
        lhs.value >= rhs.value
    }
    
    @inlinable
    public static func >= <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
        lhs.value >= rhs
    }
    
    @inlinable
    public static func >= <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
        lhs >= rhs.value
    }
    
    @inlinable
    public static func <= (lhs: Radix, rhs: Radix) -> Bool {
        lhs.value <= rhs.value
    }
    
    @inlinable
    public static func <= <T: BinaryInteger>(lhs: Radix, rhs: T) -> Bool {
        lhs.value <= rhs
    }
    
    @inlinable
    public static func <= <T: BinaryInteger>(lhs: T, rhs: Radix) -> Bool {
        lhs <= rhs.value
    }
}

// MARK: - Math operators

@inlinable
public func + <T>(lhs: Radix<T>, rhs: Radix<T>) -> Radix<T> {
    Radix<T>(lhs.value + rhs.value, unsafeBase: lhs.base)
}

@inlinable
public func + <T>(lhs: Radix<T>, rhs: T) -> Radix<T> {
    Radix<T>(lhs.value + rhs, unsafeBase: lhs.base)
}

@inlinable
public func + <T>(lhs: T, rhs: Radix<T>) -> T {
    lhs + rhs.value
}

@inlinable
public func - <T>(lhs: Radix<T>, rhs: Radix<T>) -> Radix<T> {
    Radix<T>(lhs.value - rhs.value, unsafeBase: lhs.base)
}

@inlinable
public func - <T>(lhs: Radix<T>, rhs: T) -> Radix<T> {
    Radix<T>(lhs.value - rhs, unsafeBase: lhs.base)
}

@inlinable
public func - <T>(lhs: T, rhs: Radix<T>) -> T {
    lhs - rhs.value
}

@inlinable
public func * <T>(lhs: Radix<T>, rhs: Radix<T>) -> Radix<T> {
    Radix<T>(lhs.value * rhs.value, unsafeBase: lhs.base)
}

@inlinable
public func * <T>(lhs: Radix<T>, rhs: T) -> Radix<T> {
    Radix<T>(lhs.value * rhs, unsafeBase: lhs.base)
}

@inlinable
public func * <T>(lhs: T, rhs: Radix<T>) -> T {
    lhs * rhs.value
}

@inlinable
public func / <T>(lhs: Radix<T>, rhs: Radix<T>) -> Radix<T> {
    Radix<T>(lhs.value / rhs.value, unsafeBase: lhs.base)
}

@inlinable
public func / <T>(lhs: Radix<T>, rhs: T) -> Radix<T> {
    Radix<T>(lhs.value / rhs, unsafeBase: lhs.base)
}

@inlinable
public func / <T>(lhs: T, rhs: Radix<T>) -> T {
    lhs / rhs.value
}

// MARK: - Mutating math operators

@inlinable
public func += <T>(lhs: inout Radix<T>, rhs: Radix<T>) {
    lhs.value += rhs.value
}

@inlinable
public func += <T>(lhs: inout Radix<T>, rhs: T) {
    lhs.value += rhs
}

@inlinable
public func += <T>(lhs: inout T, rhs: Radix<T>) {
    lhs += rhs.value
}

@inlinable
public func -= <T>(lhs: inout Radix<T>, rhs: Radix<T>) {
    lhs.value -= rhs.value
}

@inlinable
public func -= <T>(lhs: inout Radix<T>, rhs: T) {
    lhs.value -= rhs
}

@inlinable
public func -= <T>(lhs: inout T, rhs: Radix<T>) {
    lhs -= rhs.value
}

@inlinable
public func *= <T>(lhs: inout Radix<T>, rhs: Radix<T>) {
    lhs.value *= rhs.value
}

@inlinable
public func *= <T>(lhs: inout Radix<T>, rhs: T) {
    lhs.value *= rhs
}

@inlinable
public func *= <T>(lhs: inout T, rhs: Radix<T>) {
    lhs *= rhs.value
}

@inlinable
public func /= <T>(lhs: inout Radix<T>, rhs: Radix<T>) {
    lhs.value /= rhs.value
}

@inlinable
public func /= <T>(lhs: inout Radix<T>, rhs: T) {
    lhs.value /= rhs
}

@inlinable
public func /= <T>(lhs: inout T, rhs: Radix<T>) {
    lhs /= rhs.value
}

// MARK: Bitwise bit shift

extension Radix {
    @inlinable
    public static func >> <T>(lhs: Radix<T>, rhs: Radix) -> Radix<T> {
        Radix<T>(lhs.value >> rhs.value, unsafeBase: lhs.base)
    }
    
    @inlinable
    public static func >> <T: BinaryInteger>(lhs: Radix, rhs: T) -> Radix {
        Radix(lhs.value >> rhs, unsafeBase: lhs.base)
    }
    
    @inlinable
    public static func >> <T: BinaryInteger>(lhs: T, rhs: Radix) -> T {
        lhs >> rhs.value
    }
    
    @inlinable
    public static func << <T>(lhs: Radix<T>, rhs: Radix) -> Radix<T> {
        Radix<T>(lhs.value << rhs.value, unsafeBase: lhs.base)
    }
    
    @inlinable
    public static func << <T: BinaryInteger>(lhs: Radix, rhs: T) -> Radix {
        Radix(lhs.value << rhs, unsafeBase: lhs.base)
    }
    
    @inlinable
    public static func << <T: BinaryInteger>(lhs: T, rhs: Radix) -> T {
        lhs << rhs.value
    }
}

// MARK: Bitwise AND

extension Radix {
    @inlinable
    public static func & (lhs: Radix, rhs: Radix) -> Radix {
        Radix(lhs.value & rhs.value, unsafeBase: lhs.base)
    }
    
    @inlinable
    public static func & <T: BinaryInteger>(lhs: Radix, rhs: T) -> Radix<T> {
        Radix<T>(T(lhs.value) & rhs, unsafeBase: lhs.base)
    }
    
    @inlinable
    public static func & <T: BinaryInteger>(lhs: T, rhs: Radix) -> T {
        lhs & T(rhs.value)
    }
}
