//
//  Radix Bit Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import XCTest
import SwiftRadix

extension SwiftRadixTests {
    func testRadix_Bit_Get() {
        let source = 0b11001100
        
        // binary
        
        XCTAssertTrue(source.binary.bit(0) == 0b0)
        XCTAssertTrue(source.binary.bit(1) == 0b0)
        XCTAssertTrue(source.binary.bit(2) == 0b1)
        XCTAssertTrue(source.binary.bit(3) == 0b1)
        
        XCTAssertEqual(source.binary[bit: 0], 0b0)
        XCTAssertEqual(source.binary[bit: 1], 0b0)
        XCTAssertEqual(source.binary[bit: 2], 0b1)
        XCTAssertEqual(source.binary[bit: 3], 0b1)
        
        // hex
        
        XCTAssertTrue(source.hex.bit(0) == 0b0)
        XCTAssertTrue(source.hex.bit(1) == 0b0)
        XCTAssertTrue(source.hex.bit(2) == 0b1)
        XCTAssertTrue(source.hex.bit(3) == 0b1)
        
        XCTAssertEqual(source.hex[bit: 0], 0b0)
        XCTAssertEqual(source.hex[bit: 1], 0b0)
        XCTAssertEqual(source.hex[bit: 2], 0b1)
        XCTAssertEqual(source.hex[bit: 3], 0b1)
        
        // octal
        
        XCTAssertTrue(source.octal.bit(0) == 0b0)
        XCTAssertTrue(source.octal.bit(1) == 0b0)
        XCTAssertTrue(source.octal.bit(2) == 0b1)
        XCTAssertTrue(source.octal.bit(3) == 0b1)
        
        XCTAssertEqual(source.octal[bit: 0], 0b0)
        XCTAssertEqual(source.octal[bit: 1], 0b0)
        XCTAssertEqual(source.octal[bit: 2], 0b1)
        XCTAssertEqual(source.octal[bit: 3], 0b1)
        
        // edge cases
        
        XCTAssertTrue(source.hex.bit(-1) == 0) // out of bounds, default 0
        XCTAssertTrue(source.hex.bit(9) == 0)  // out of bounds, default 0
    }
    
    func testRadix_Bit_Subscript_Set() {
        var radix: Radix<Int>
        
        // binary
        
        radix = 0b11001100.binary
        
        radix[bit: 0] = 1
        
        XCTAssertEqual(radix.value, 0b11001101)
        
        radix[bit: 1] = 1
        
        XCTAssertEqual(radix.value, 0b11001111)
        
        // hex
        
        radix = 0b11001100.hex
        
        radix[bit: 0] = 1
        
        XCTAssertEqual(radix.value, 0b11001101)
        
        radix[bit: 1] = 1
        
        XCTAssertEqual(radix.value, 0b11001111)
        
        // octal
        
        radix = 0b11001100.octal
        
        radix[bit: 0] = 1
        
        XCTAssertEqual(radix.value, 0b11001101)
        
        radix[bit: 1] = 1
        
        XCTAssertEqual(radix.value, 0b11001111)
        
        // edge cases
        
        radix = 0b11001100.hex
        
        radix[bit: 0] = 3 // invalid value, fails silently
        
        XCTAssertEqual(radix.value, 0b11001100)
        
        radix = 0b11001100.hex
        
        radix[bit: -1] = 1 // invalid index, fails silently
        
        XCTAssertEqual(radix.value, 0b11001100)
    }
}
