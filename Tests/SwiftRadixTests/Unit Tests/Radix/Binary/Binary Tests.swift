//
//  Binary Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//

import XCTest
import SwiftRadix

extension SwiftRadixTests {
    func testBinary() {
        // init from int
        
        let binaryInt = Binary(0b1100)
        
        XCTAssertEqual(binaryInt.value, Int(0b1100))
        XCTAssertEqual(binaryInt.base, 2)
        
        // init from string with prefix, default Int value
        
        let binaryString1 = Binary("0b1100") // Int default
        
        XCTAssertNotNil(binaryString1)
        
        XCTAssertEqual(binaryString1?.value.bitWidth, Int.bitWidth)
        XCTAssertEqual(binaryString1?.value, Int(0b1100))
        XCTAssertEqual(binaryString1?.base, 2)
        
        // init from string without prefix, specifying Int32 value
        
        let binaryString2 = Binary("1100", as: Int32.self)
        
        XCTAssertNotNil(binaryString2)
        
        XCTAssertEqual(binaryString2?.value.bitWidth, Int32.bitWidth)
        XCTAssertEqual(binaryString2?.value, Int32(0b1100))
        XCTAssertEqual(binaryString2?.base, 2)
    }
    
    func testBinary_StringFailures() {
        // wrong prefix case
        XCTAssertNil("0B10".binary)
        
        // wrong prefix
        XCTAssertNil("0x1".binary)
        XCTAssertNil("0o1".binary)
        
        // invalid base digits
        XCTAssertNil("0b2".binary)
        
        // invalid string altogether
        XCTAssertNil("$y9_p".binary)
    }
}
