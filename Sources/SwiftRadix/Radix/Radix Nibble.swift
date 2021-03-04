//
//  Radix Nibble.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation


// MARK: - Nibble

extension Radix {
	
	/// Returns the value of the 4-bit nibble from right-to-left. `position` is zero-based.
	///
	/// Nibbles can also be get or set directly via the `[nibble: Int]` mutating subscript.
	@inline(__always) public func nibble(_ position: Int) -> Radix<NumberType> {
		
		Radix(self[nibble: position], base: base)
		
	}
	
	/// Access binary nibbles from right-to-left. `position` is zero-based.
	@inline(__always) public subscript(nibble position: Int) -> NumberType {
		
		get {
			
			(value & (0xF << (4 * NumberType(position))))
				>> (4 * NumberType(position))
			
		}
		
		set {
			
			// ensure nibble is valid
			if newValue < 0x0 || newValue > 0xF { return }
			
			// obtain old nibble value
			let mask = value & (0b1111 << (4 * NumberType(position)))
			
			// subtract old value and add new nibble value
			let setValue = (value - mask) + (newValue << (4 * position))
			
			value = setValue
			
		}
		
	}
	
}
