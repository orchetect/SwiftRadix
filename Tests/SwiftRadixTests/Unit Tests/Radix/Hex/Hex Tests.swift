//
//  Hex Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import XCTest
import SwiftRadix

extension SwiftRadixTests {
    func testHex() {
        // init from int
        
        let hexInt = Hex(0xFF)
        
        XCTAssertEqual(hexInt.value, Int(0xFF))
        XCTAssertEqual(hexInt.base, 16)
        
        // init from string with prefix, default Int value
        
        let hexString1 = Hex("0xFF") // Int default
        
        XCTAssertNotNil(hexString1)
        
        XCTAssertEqual(hexString1?.value.bitWidth, Int.bitWidth)
        XCTAssertEqual(hexString1?.value, Int(0xFF))
        XCTAssertEqual(hexString1?.base, 16)
        
        // init from string without prefix, specifying Int32 value
        
        let hexString2 = Hex("FF", as: Int32.self)
        
        XCTAssertNotNil(hexString2)
        
        XCTAssertEqual(hexString2?.value.bitWidth, Int32.bitWidth)
        XCTAssertEqual(hexString2?.value, Int32(0xFF))
        XCTAssertEqual(hexString2?.base, 16)
    }
    
    func testHex_StringFailures() {
        // wrong prefix case
        XCTAssertNil("0XFF".hex)
        
        // wrong prefix
        XCTAssertNotNil("0b1".hex) // this works because it's a valid hex string, without prefix
        XCTAssertNil("0o1".hex)
        
        // invalid base digits
        XCTAssertNil("0xZ".hex)
        
        // invalid string altogether
        XCTAssertNil("$y9_p".hex)
    }
    
    func testHex_StringCase() {
        // uppercase
        
        let radix1 = Hex("0xFF")
        
        XCTAssertNotNil(radix1)
        
        XCTAssertEqual(radix1?.value, 0xFF)
        
        // lowercase
        
        let radix2 = Hex("0xff")
        
        XCTAssertNotNil(radix2)
        
        XCTAssertEqual(radix2?.value, 0xFF)
    }
}
