//
//  Radix Nibble Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//

import XCTest
import SwiftRadix

extension SwiftRadixTests {
    func testRadix_Nibble_Get() {
        let source = 0b0101_1100
        
        // binary
        
        XCTAssertTrue(source.binary.nibble(0) == 0b1100)
        XCTAssertTrue(source.binary.nibble(1) == 0b0101)
        
        XCTAssertTrue(source.binary[nibble: 0] == 0b1100)
        XCTAssertTrue(source.binary[nibble: 1] == 0b0101)
        
        // hex
        
        XCTAssertTrue(source.hex.nibble(0) == 0b1100)
        XCTAssertTrue(source.hex.nibble(1) == 0b0101)
        
        XCTAssertTrue(source.hex[nibble: 0] == 0b1100)
        XCTAssertTrue(source.hex[nibble: 1] == 0b0101)
        
        // octal
        
        XCTAssertTrue(source.octal.nibble(0) == 0b1100)
        XCTAssertTrue(source.octal.nibble(1) == 0b0101)
        
        XCTAssertTrue(source.octal[nibble: 0] == 0b1100)
        XCTAssertTrue(source.octal[nibble: 1] == 0b0101)
        
        // edge cases
        
        XCTAssertTrue(source.binary.nibble(-1) == 0) // out of bounds, default 0
        XCTAssertTrue(source.binary.nibble(2) == 0)  // out of bounds, default 0
    }
    
    func testRadix_Nibble_Subscript_Set() {
        var radix: Radix<Int>
        
        // binary
        
        radix = 0b0101_1100.binary
        
        radix[nibble: 0] = 0b0110
        
        XCTAssertEqual(radix.value, 0b0101_0110)
        
        radix[nibble: 1] = 0b0110
        
        XCTAssertEqual(radix.value, 0b0110_0110)
        
        // hex
        
        radix = 0b0101_1100.hex
        
        radix[nibble: 0] = 0b0110
        
        XCTAssertEqual(radix.value, 0b0101_0110)
        
        radix[nibble: 1] = 0b0110
        
        XCTAssertEqual(radix.value, 0b0110_0110)
        
        // octal
        
        radix = 0b0101_1100.octal
        
        radix[nibble: 0] = 0b0110
        
        XCTAssertEqual(radix.value, 0b0101_0110)
        
        radix[nibble: 1] = 0b0110
        
        XCTAssertEqual(radix.value, 0b0110_0110)
        
        // edge cases
        
        radix = 0b0101_1100.hex
        
        radix[nibble: 0] = 20 // invalid value, fails silently
        
        XCTAssertEqual(radix.value, 0b0101_1100)
        
        radix[nibble: -1] = 1 // invalid index, fails silently
        
        XCTAssertEqual(radix.value, 0b0101_1100)
    }
}
