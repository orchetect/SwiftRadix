//
//  Radix Nibble Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import XCTest
import SwiftRadix

final class RadixNibbleTests: XCTestCase {
    func testRadix_Nibble_Get() {
        let source = 0b01011100
        
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
        
        radix = 0b01011100.binary
        
        radix[nibble: 0] = 0b0110
        
        XCTAssertEqual(radix.value, 0b01010110)
        
        radix[nibble: 1] = 0b0110
        
        XCTAssertEqual(radix.value, 0b01100110)
        
        // hex
        
        radix = 0b01011100.hex
        
        radix[nibble: 0] = 0b0110
        
        XCTAssertEqual(radix.value, 0b01010110)
        
        radix[nibble: 1] = 0b0110
        
        XCTAssertEqual(radix.value, 0b01100110)
        
        // octal
        
        radix = 0b01011100.octal
        
        radix[nibble: 0] = 0b0110
        
        XCTAssertEqual(radix.value, 0b01010110)
        
        radix[nibble: 1] = 0b0110
        
        XCTAssertEqual(radix.value, 0b01100110)
        
        // edge cases
        
        radix = 0b01011100.hex
        
        radix[nibble: 0] = 20 // invalid value, fails silently
        
        XCTAssertEqual(radix.value, 0b01011100)
        
        radix[nibble: -1] = 1 // invalid index, fails silently
        
        XCTAssertEqual(radix.value, 0b01011100)
    }
}
