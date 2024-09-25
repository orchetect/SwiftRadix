//
//  Octal Type Extensions Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import XCTest

final class OctalTypeExtensionsTests: XCTestCase {
    func testOctal_TypeExtensions_BinaryInteger() {
        let validString = "123"
        
        XCTAssertEqual(0o123.octal.stringValue, validString)
        XCTAssertEqual(UInt(0o123).octal.stringValue, validString)
        XCTAssertEqual(Int8(0o123).octal.stringValue, validString)
        XCTAssertEqual(UInt8(0o123).octal.stringValue, validString)
        XCTAssertEqual(Int16(0o123).octal.stringValue, validString)
        XCTAssertEqual(UInt16(0o123).octal.stringValue, validString)
        XCTAssertEqual(Int32(0o123).octal.stringValue, validString)
        XCTAssertEqual(UInt32(0o123).octal.stringValue, validString)
        XCTAssertEqual(Int64(0o123).octal.stringValue, validString)
        XCTAssertEqual(UInt64(0o123).octal.stringValue, validString)
    }
    
    func testOctal_TypeExtensions_String() {
        let validValue = 0o123
        
        let radix1 = "0o123".octal // Int default
        
        XCTAssertNotNil(radix1)
        
        XCTAssertEqual(radix1?.value, Int(validValue))
        
        let radix2 = "123".octal // Int default
        
        XCTAssertNotNil(radix2)
        
        XCTAssertEqual(radix2?.value, Int(validValue))
        
        let radix3 = "123".octal(as: Int32.self)
        
        XCTAssertNotNil(radix3)
        
        XCTAssertEqual(radix3?.value, Int32(validValue))
    }
    
    func testOctal_TypeExtensions_StringArray() {
        let source = ["000", "0o123"]
        
        let radixArray1 = source.octal // Int default
        
        XCTAssertEqual(radixArray1.count, 2)
        
        XCTAssertEqual(radixArray1[0]?.value, 0x000)
        XCTAssertEqual(radixArray1[1]?.value, 0o123)
        
        let radixArray2 = source.octal(as: Int32.self)
        
        XCTAssertEqual(radixArray2.count, 2)
        
        XCTAssertEqual(radixArray2[0]?.value, Int32(0x000))
        XCTAssertEqual(radixArray2[1]?.value, Int32(0o123))
    }
    
    func testOctal_TypeExtensions_BinIntCollection() {
        let source = [0o000, 0o123]
        
        let radixArray = source.octal
        
        XCTAssertEqual(radixArray.count, 2)
        
        XCTAssertEqual(radixArray[0].value, 0x000)
        XCTAssertEqual(radixArray[1].value, 0o123)
    }
    
    func testOctal_TypeExtensions_Data() {
        let source = Data([0o000, 0o123])
        
        let radixArray = source.octal
        
        XCTAssertEqual(radixArray.count, 2)
        
        XCTAssertEqual(radixArray[0].value, 0x000)
        XCTAssertEqual(radixArray[1].value, 0o123)
    }
}
