//
//  Octal Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//

import XCTest
import SwiftRadix

extension SwiftRadixTests {
    func testOctal() {
        // init from int
        
        let octalInt = Octal(0o123)
        
        XCTAssertEqual(octalInt.value, Int(0o123))
        XCTAssertEqual(octalInt.base, 8)
        
        // init from string with prefix, default Int value
        
        let octalString1 = Octal("0o123") // Int default
        
        XCTAssertNotNil(octalString1)
        
        XCTAssertEqual(octalString1?.value.bitWidth, Int.bitWidth)
        XCTAssertEqual(octalString1?.value, Int(0o123))
        XCTAssertEqual(octalString1?.base, 8)
        
        // init from string without prefix, specifying Int32 value
        
        let octalString2 = Octal("123", as: Int32.self)
        
        XCTAssertNotNil(octalString2)
        
        XCTAssertEqual(octalString2?.value.bitWidth, Int32.bitWidth)
        XCTAssertEqual(octalString2?.value, Int32(0o123))
        XCTAssertEqual(octalString2?.base, 8)
    }
    
    func testOctal_StringFailures() {
        // wrong prefix case
        XCTAssertNil("0O10".octal)
        
        // wrong prefix
        XCTAssertNil("0b1".octal)
        XCTAssertNil("0x1".octal)
        
        // invalid base digits
        XCTAssertNil("0o8".octal)
        
        // invalid string altogether
        XCTAssertNil("$y9_p".octal)
    }
}
