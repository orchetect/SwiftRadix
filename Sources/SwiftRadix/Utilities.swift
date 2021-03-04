//
//  Utilities.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-12.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import Foundation


// MARK: - OptionalType

// see for more info: https://stackoverflow.com/questions/50999688/swift-extension-on-sometypet-to-produce-t-possible
//
// Workaround useful to enable extensions on types such as `Struct<T>?` or `[Struct<T>?]`.
//
// ie:
// ```
// extension Collection
//   where Element: OptionalType,
//         Element.Wrapped: RadixProtocol
// { ... }
// ```

public protocol OptionalType {
	
	associatedtype Wrapped
	
	/// Return an object as an optional.
	var optional: Wrapped? { get }
	
}

extension Optional: OptionalType {
	
	@inline(__always) public var optional: Wrapped? {
		
		self
		
	}
	
}


// MARK: - BinaryInteger

extension BinaryInteger {
	
	/// Returns the value rounded up to multiples of a given value.
	internal func roundedUp(toMultiplesOf: Self) -> Self {
		
		if toMultiplesOf < 1 { return self }
		
		let source: Self =
			self >= 0
			? self
			: 0 - self
		
		let isNegative: Bool = self < 0
		
		let rem = source % toMultiplesOf
		
		let divisions =
			rem == 0
			? self
			: self + (isNegative ? rem : toMultiplesOf - rem )
		
		return divisions
		
	}
	
}


// MARK: - String

extension StringProtocol {
		
	/// Splits a string into groups of `length` characters, grouping from left-to-right. If `backwards` is true, right-to-left.
	internal func split(every: Int,
						backwards: Bool = false) -> [Self.SubSequence] {
		
		var result: [Self.SubSequence] = []
		
		for i in stride(from: 0, to: self.count, by: every) {
			
			switch backwards {
			case true:
				let endIndex = self.index(self.endIndex, offsetBy: -i)
				let startIndex = self.index(endIndex,
											offsetBy: -every,
											limitedBy: self.startIndex)
					?? self.startIndex
				
				result.insert(self[startIndex..<endIndex], at: 0)
				
			case false:
				let startIndex = self.index(self.startIndex, offsetBy: i)
				let endIndex = self.index(startIndex,
										  offsetBy: every,
										  limitedBy: self.endIndex)
					?? self.endIndex
				
				result.append(self[startIndex..<endIndex])
				
			}
			
		}
		
		return result
		
	}
	
}
