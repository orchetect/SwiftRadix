//
//  Radix Bytes Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import XCTest
import SwiftRadix

final class RadixBytesTests: XCTestCase {
    func testRadix_Bytes() {
        // binary
        
        XCTAssertEqual(
            UInt8(0xFF).binary.bytes,
            [0xFF]
        )
        
        XCTAssertEqual(
            UInt16(0xFF).binary.bytes,
            [0xFF, 0x00]
        )
        
        XCTAssertEqual(
            Int(0xFF).binary.bytes,
            [0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        )
        
        // hex
        
        XCTAssertEqual(
            UInt8(0xFF).hex.bytes,
            [0xFF]
        )
        
        XCTAssertEqual(
            UInt16(0xFF).hex.bytes,
            [0xFF, 0x00]
        )
        
        XCTAssertEqual(
            Int(0xFF).hex.bytes,
            [0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        )
        
        // octal
        
        XCTAssertEqual(
            UInt8(0xFF).octal.bytes,
            [0xFF]
        )
        
        XCTAssertEqual(
            UInt16(0xFF).octal.bytes,
            [0xFF, 0x00]
        )
        
        XCTAssertEqual(
            Int(0xFF).octal.bytes,
            [0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        )
    }
}
