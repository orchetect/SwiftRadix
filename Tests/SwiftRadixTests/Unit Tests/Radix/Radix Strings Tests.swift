//
//  Radix Strings Tests.swift
//  SwiftRadix
//
//  Created by Steffan Andrews on 2020-09-14.
//  MIT License
//  https://github.com/orchetect/SwiftRadix
//

import XCTest
@testable import SwiftRadix

extension SwiftRadixTests {
	
	func testRadix_stringValue_Get() {
		
		// binary
		
		XCTAssertEqual(0b0.binary.stringValue, "0")
		XCTAssertEqual(0b1100_1100.binary.stringValue, "11001100")
		
		// hex
		
		XCTAssertEqual(0x00.hex.stringValue, "0")
		XCTAssertEqual(0xFF.hex.stringValue, "FF")
		
		// octal
		
		XCTAssertEqual(0x000.octal.stringValue, "0")
		XCTAssertEqual(0o123.octal.stringValue, "123")
		
	}
	
	func testRadix_stringValue_Get_Extents() {
		
		// binary
		
		XCTAssertEqual(UInt.max.binary.stringValue,
					   "1111111111111111111111111111111111111111111111111111111111111111")
		
		// hex
		
		XCTAssertEqual(UInt.max.hex.stringValue,
					   "FFFFFFFFFFFFFFFF")
		
		// octal
		
		XCTAssertEqual(UInt.max.octal.stringValue,
					   "1777777777777777777777")
		
	}
	
	func testRadix_stringValue_Set() {
		
		// binary
		
		var source1 = 0b0.binary
		
		source1.stringValue = "11001100"		// no prefix
		XCTAssertEqual(source1.value, 0b1100_1100)
		
		source1.stringValue = "0b00110011"		// with prefix
		XCTAssertEqual(source1.value, 0b0011_0011)
		
		// hex
		
		var source2 = 0x00.hex
		
		source2.stringValue = "FF"				// no prefix
		XCTAssertEqual(source2.value, 0xFF)
		
		source2.stringValue = "0xFFFF"			// with prefix
		XCTAssertEqual(source2.value, 0xFFFF)
		
		// octal
		
		var source3 = 0o0.octal
		
		source3.stringValue = "123"				// no prefix
		XCTAssertEqual(source3.value, 0o123)
		
		source3.stringValue = "0o1234"			// with prefix
		XCTAssertEqual(source3.value, 0o1234)
		
	}
	
	func testRadix_stringValue_Set_Extents() {
		
		// binary
		
		var source1 = UInt(0b0).binary
		
		source1.stringValue = "1111111111111111111111111111111111111111111111111111111111111111"
		
		XCTAssertEqual(source1.value, UInt.max)
		
		// hex
		
		var source2 = UInt(0x00).hex
		
		source2.stringValue = "FFFFFFFFFFFFFFFF"
			
		XCTAssertEqual(source2.value, UInt.max)
		
		// octal
		
		var source3 = UInt(0o0).octal
		
		source3.stringValue = "1777777777777777777777"
		
		XCTAssertEqual(source3.value, UInt.max)
		
	}
	
	func testRadix_stringValue_Set_Extents_EdgeCases() {
		
		// binary
		
		var source1 = 0b0.binary
		
		source1.stringValue = "1111111111111111111111111111111111111111111111111111111111111111"
		
		XCTAssertEqual(source1.value, 0) // string overflowed Int, set silently fails
		
		// hex
		
		var source2 = 0x00.hex
		
		source2.stringValue = "FFFFFFFFFFFFFFFF"
			
		XCTAssertEqual(source2.value, 0) // string overflowed Int, set silently fails
		
		// octal
		
		var source3 = 0o0.octal
		
		source3.stringValue = "1777777777777777777777"
		
		XCTAssertEqual(source3.value, 0) // string overflowed Int, set silently fails
		
	}
	
	func testRadix_stringValue_Prefix() {
		
		// binary
		
		XCTAssertEqual(0b0.binary.stringValue(prefix: true), "0b0")
		XCTAssertEqual(0b0.binary.stringValue(prefix: false), "0")
		
		// hex
		
		XCTAssertEqual(0b0.hex.stringValue(prefix: true), "0x0")
		XCTAssertEqual(0b0.hex.stringValue(prefix: false), "0")
		
		// octal
		
		XCTAssertEqual(0b0.octal.stringValue(prefix: true), "0o0")
		XCTAssertEqual(0b0.octal.stringValue(prefix: false), "0")
		
	}
	
	func testRadix_stringValue_PadTo() {
		
		// binary
		
		let source1 = 0b0000_0111.binary
		
		XCTAssertEqual(source1.stringValue(padTo: 0), "111")
		XCTAssertEqual(source1.stringValue(padTo: 1), "111")
		XCTAssertEqual(source1.stringValue(padTo: 2), "111")
		XCTAssertEqual(source1.stringValue(padTo: 6), "000111")
		
		XCTAssertEqual(source1.stringValue(padTo: 2, prefix: true), "0b111")
		XCTAssertEqual(source1.stringValue(padTo: 6, prefix: true), "0b000111")
		
		// edge cases
		XCTAssertEqual(source1.stringValue(padTo: -1), "111")
		
		
		// hex
		
		let source2 = 0x0F.hex
		
		XCTAssertEqual(source2.stringValue(padTo: 0), "F")
		XCTAssertEqual(source2.stringValue(padTo: 1), "F")
		XCTAssertEqual(source2.stringValue(padTo: 2), "0F")
		XCTAssertEqual(source2.stringValue(padTo: 6), "00000F")
		
		XCTAssertEqual(source2.stringValue(padTo: 2, prefix: true), "0x0F")
		
		// edge cases
		XCTAssertEqual(source2.stringValue(padTo: -1), "F")
		
		
		// octal
		
		let source3 = 0o17.octal
		
		XCTAssertEqual(source3.stringValue(padTo: 0), "17")
		XCTAssertEqual(source3.stringValue(padTo: 1), "17")
		XCTAssertEqual(source3.stringValue(padTo: 2), "17")
		XCTAssertEqual(source3.stringValue(padTo: 6), "000017")
		
		XCTAssertEqual(source3.stringValue(padTo: 2, prefix: true), "0o17")
		
		// edge cases
		XCTAssertEqual(source3.stringValue(padTo: -1), "17")
		
	}
	
	func testRadix_stringValue_PadTo_EdgeCases() {
		
		// ensure padding of 0 or a negative value defaults to an internal padding of 1
		
		// binary
		
		XCTAssertEqual(0b0.binary.stringValue(padTo: -1), "0")
		XCTAssertEqual(0b0.binary.stringValue(padTo: 0), "0")
		
		// hex
		
		XCTAssertEqual(0x0.hex.stringValue(padTo: -1), "0")
		XCTAssertEqual(0x0.hex.stringValue(padTo: 0), "0")
		
		// octal
		
		XCTAssertEqual(0o0.hex.stringValue(padTo: -1), "0")
		XCTAssertEqual(0o0.hex.stringValue(padTo: 0), "0")
		
	}
	
	func testRadix_stringValue_PadTo_SplitEvery() {
		
		// binary
		
		let source1 = 0b0000_0111.binary
		
		XCTAssertEqual(source1.stringValue(padTo: 0, splitEvery: 0), "111")
		XCTAssertEqual(source1.stringValue(padTo: 1, splitEvery: 1), "1 1 1")
		XCTAssertEqual(source1.stringValue(padTo: 1, splitEvery: 2), "1 11")
		XCTAssertEqual(source1.stringValue(padTo: 2, splitEvery: 2), "1 11")
		XCTAssertEqual(source1.stringValue(padTo: 4, splitEvery: 3), "0 111")
		
		// prefix treats it as a Swift Integer Literal, inserting underscores for splits
		XCTAssertEqual(source1.stringValue(padTo: 8, splitEvery: 2, prefix: true), "0b00_00_01_11")
		
		// edge cases
		XCTAssertEqual(source1.stringValue(padTo: 2, splitEvery: -1), "111")
		
		
		// hex
		
		let source2 = 0xF0F.hex
		
		XCTAssertEqual(source2.stringValue(padTo: 0, splitEvery: 0), "F0F")
		XCTAssertEqual(source2.stringValue(padTo: 1, splitEvery: 1), "F 0 F")
		XCTAssertEqual(source2.stringValue(padTo: 2, splitEvery: 2), "F 0F")
		XCTAssertEqual(source2.stringValue(padTo: 8, splitEvery: 3), "00 000 F0F")
		
		// prefix treats it as a Swift Integer Literal, inserting underscores for splits
		XCTAssertEqual(source2.stringValue(padTo: 8, splitEvery: 2, prefix: true), "0x00_00_0F_0F")
		
		// edge cases
		XCTAssertEqual(source2.stringValue(padTo: 2, splitEvery: -1), "F0F")
		
		
		// octal
		
		let source3 = 0o7.octal
		
		XCTAssertEqual(source3.stringValue(padTo: 0, splitEvery: 0), "7")
		XCTAssertEqual(source3.stringValue(padTo: 1, splitEvery: 1), "7")
		XCTAssertEqual(source3.stringValue(padTo: 2, splitEvery: 2), "07")
		XCTAssertEqual(source3.stringValue(padTo: 4, splitEvery: 3), "0 007")
		
		// prefix treats it as a Swift Integer Literal, inserting underscores for splits
		XCTAssertEqual(source3.stringValue(padTo: 2, splitEvery: 2, prefix: true), "0o07")
		
		// edge cases
		XCTAssertEqual(source3.stringValue(padTo: 2, splitEvery: -1), "07")
		
	}
	
	func testRadix_stringValue_PadToEvery() {
		
		// binary
		
		let source1 = 0b0001_1111.binary
		
		XCTAssertEqual(source1.stringValue(padToEvery: 0), "11111")
		XCTAssertEqual(source1.stringValue(padToEvery: 1), "11111")
		XCTAssertEqual(source1.stringValue(padToEvery: 2), "011111")
		XCTAssertEqual(source1.stringValue(padToEvery: 4), "00011111")
		
		XCTAssertEqual(source1.stringValue(padToEvery: 2, prefix: true), "0b011111")
		
		// edge cases
		XCTAssertEqual(source1.stringValue(padToEvery: -1), "11111")
		
		
		// hex
		
		let source2 = 0xFFF.hex
		
		XCTAssertEqual(source2.stringValue(padToEvery: 0), "FFF")
		XCTAssertEqual(source2.stringValue(padToEvery: 1), "FFF")
		XCTAssertEqual(source2.stringValue(padToEvery: 2), "0FFF")
		XCTAssertEqual(source2.stringValue(padToEvery: 6), "000FFF")
		
		XCTAssertEqual(source2.stringValue(padToEvery: 2, prefix: true), "0x0FFF")
		
		// edge cases
		XCTAssertEqual(source2.stringValue(padToEvery: -1), "FFF")
		
		
		// octal
		
		let source3 = 0o123456.octal
		
		XCTAssertEqual(source3.stringValue(padToEvery: 0), "123456")
		XCTAssertEqual(source3.stringValue(padToEvery: 1), "123456")
		XCTAssertEqual(source3.stringValue(padToEvery: 2), "123456")
		XCTAssertEqual(source3.stringValue(padToEvery: 4), "00123456")
		
		XCTAssertEqual(source3.stringValue(padToEvery: 2, prefix: true), "0o123456")
		
		// edge cases
		XCTAssertEqual(source3.stringValue(padToEvery: -1), "123456")
		
	}
	
	func testRadix_stringValue_PadToEvery_SplitEvery() {
		
		// binary
		
		let source1 = 0b0001_1111.binary
		
		XCTAssertEqual(source1.stringValue(padToEvery: 0, splitEvery: 0), "11111")
		XCTAssertEqual(source1.stringValue(padToEvery: 1, splitEvery: 1), "1 1 1 1 1")
		XCTAssertEqual(source1.stringValue(padToEvery: 1, splitEvery: 2), "1 11 11")
		XCTAssertEqual(source1.stringValue(padToEvery: 2, splitEvery: 2), "01 11 11")
		XCTAssertEqual(source1.stringValue(padToEvery: 4, splitEvery: 3), "00 011 111")
		
		// prefix treats it as a Swift Integer Literal, inserting underscores for splits
		XCTAssertEqual(source1.stringValue(padToEvery: 2, splitEvery: 2, prefix: true), "0b01_11_11")
		
		// edge cases
		XCTAssertEqual(source1.stringValue(padToEvery: 2, splitEvery: -1), "011111")
		
		
		// hex
		
		let source2 = 0xFFF.hex
		
		XCTAssertEqual(source2.stringValue(padToEvery: 0, splitEvery: 0), "FFF")
		XCTAssertEqual(source2.stringValue(padToEvery: 1, splitEvery: 1), "F F F")
		XCTAssertEqual(source2.stringValue(padToEvery: 2, splitEvery: 2), "0F FF")
		XCTAssertEqual(source2.stringValue(padToEvery: 8, splitEvery: 3), "00 000 FFF")
		
		// prefix treats it as a Swift Integer Literal, inserting underscores for splits
		XCTAssertEqual(source2.stringValue(padToEvery: 2, splitEvery: 2, prefix: true), "0x0F_FF")
		
		// edge cases
		XCTAssertEqual(source2.stringValue(padToEvery: 2, splitEvery: -1), "0FFF")
		
		
		// octal
		
		let source3 = 0o123456.octal
		
		XCTAssertEqual(source3.stringValue(padToEvery: 0, splitEvery: 0), "123456")
		XCTAssertEqual(source3.stringValue(padToEvery: 1, splitEvery: 1), "1 2 3 4 5 6")
		XCTAssertEqual(source3.stringValue(padToEvery: 2, splitEvery: 2), "12 34 56")
		XCTAssertEqual(source3.stringValue(padToEvery: 4, splitEvery: 3), "00 123 456")
		
		// prefix treats it as a Swift Integer Literal, inserting underscores for splits
		XCTAssertEqual(source3.stringValue(padToEvery: 2, splitEvery: 2, prefix: true), "0o12_34_56")
		
		// edge cases
		XCTAssertEqual(source3.stringValue(padToEvery: 2, splitEvery: -1), "123456")
		
	}
	
}
