//
//  Radix Bit.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation

extension Radix {
	
	/// Access binary bits from right-to-left. `position` is zero-based.
	///
	/// Bits can also be get or set directly via the `[bit: Int]` mutating subscript.
	@inline(__always) public func bit(_ position: Int) -> Radix<NumberType> {
		
		Radix(self[bit: position], base: base)
		
	}
	
	/// Access binary bits from right-to-left. `position` is zero-based.
	@inline(__always) public subscript(bit position: Int) -> NumberType {
		
		get {
			
			(value & (0b1 << position)) >> position
			
		}
		
		set {
			
			// ensure bit is valid
			if newValue < 0b0 || newValue > 0b1 { return }
			
			// obtain old bit value
			let mask = value & (0b1 << NumberType(position))
			
			// subtract old value and add new bit value
			let setValue = (value - mask) + (newValue << position)
			
			value = setValue
			
		}
		
	}
	
}
