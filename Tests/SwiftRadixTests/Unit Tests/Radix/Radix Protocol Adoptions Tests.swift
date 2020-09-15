//
//  Radix Protocol Adoptions Tests.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-13.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import XCTest
@testable import SwiftRadix

extension SwiftRadixTests {
	
	func testRadix_CustomStringConvertible() {
		
		// CustomStringConvertible
		
		// binary
		
		XCTAssertEqual(String(describing: 1.binary),
					   "Radix<Int>(0b1)")
		XCTAssertEqual(1.binary.description,
					   "Radix<Int>(0b1)")
		
		// hex
		
		XCTAssertEqual(String(describing: 1.hex),
					   "Radix<Int>(0x1)")
		XCTAssertEqual(1.hex.description,
					   "Radix<Int>(0x1)")
		
		// octal
		
		XCTAssertEqual(String(describing: 1.octal),
					   "Radix<Int>(0o1)")
		XCTAssertEqual(1.octal.description,
					   "Radix<Int>(0o1)")
		
		// CustomDebugStringConvertible
		
		// binary
		
		XCTAssertEqual(1.binary.debugDescription,
					   "Radix<Int>(0b1)")
		
		// hex
		
		XCTAssertEqual(1.hex.debugDescription,
					   "Radix<Int>(0x1)")
		
		// octal
		
		XCTAssertEqual(1.octal.debugDescription,
					   "Radix<Int>(0o1)")
		
	}
	
	func testRadix_Hashable() {
		
		// Dictionary - [Key : Hashable]
		
		var dict: [String : Radix<Int>] = [:]
		
		dict.updateValue(1.hex, forKey: "value1")
		
		XCTAssertEqual(dict["value1"]!.value, 1)
		
		// Set - Hashable
		
		var set: Set = [1.hex]
		
		set.update(with: 1.hex)
		
		XCTAssertEqual(set.count, 1) // should recognize the dupe was not added
		
		set.update(with: 2.hex)
		
		XCTAssertEqual(set.count, 2)
		
	}
	
}
