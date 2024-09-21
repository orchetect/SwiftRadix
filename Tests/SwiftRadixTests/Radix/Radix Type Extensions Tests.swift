//
//  Radix Type Extensions Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import XCTest
import SwiftRadix

final class RadixTypeExtensionsTests: XCTestCase {
    func testRadix_TypeExtensions_BinaryInteger() {
        let validString = "1100"
        
        XCTAssertEqual(0b1100.radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(UInt(0b1100).radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(Int8(0b1100).radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(UInt8(0b1100).radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(Int16(0b1100).radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(UInt16(0b1100).radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(Int32(0b1100).radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(UInt32(0b1100).radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(Int64(0b1100).radix(base: 2)?.stringValue, validString)
        XCTAssertEqual(UInt64(0b1100).radix(base: 2)?.stringValue, validString)
    }
    
    func testRadix_TypeExtensions_String() {
        let validValue = 0b1100
        
        let radix1 = "0b1100".radix(base: 2) // Int default
        
        XCTAssertNotNil(radix1)
        
        XCTAssertEqual(radix1?.value, Int(validValue))
        
        let radix2 = "1100".radix(base: 2) // Int default
        
        XCTAssertNotNil(radix2)
        
        XCTAssertEqual(radix2?.value, Int(validValue))
        
        let radix3 = "1100".radix(base: 2, as: Int32.self)
        
        XCTAssertNotNil(radix3)
        
        XCTAssertEqual(radix3?.value, Int32(validValue))
    }
    
    func testRadix_TypeExtensions_StringArray() {
        let source = ["0000", "0b1111"]
        
        let radixArray1 = source.radix(base: 2) // Int default
        
        XCTAssertEqual(radixArray1.count, 2)
        
        XCTAssertEqual(radixArray1[0]?.value, 0b0000)
        XCTAssertEqual(radixArray1[1]?.value, 0b1111)
        
        let radixArray2 = source.radix(base: 2, as: Int32.self)
        
        XCTAssertEqual(radixArray2.count, 2)
        
        XCTAssertEqual(radixArray2[0]?.value, Int32(0b0000))
        XCTAssertEqual(radixArray2[1]?.value, Int32(0b1111))
    }
    
    func testRadix_TypeExtensions_BinIntCollection() {
        let source = [0b0000, 0b1111]
        
        let radixArray = source.radix(base: 2)
        
        XCTAssertEqual(radixArray?.count, 2)
        
        XCTAssertEqual(radixArray?[0].value, 0b0000)
        XCTAssertEqual(radixArray?[1].value, 0b1111)
    }
    
    func testRadix_TypeExtensions_Data() {
        let source = Data([0b0000, 0b1111])
        
        let radixArray = source.radix(base: 2)
        
        XCTAssertEqual(radixArray?.count, 2)
        
        XCTAssertEqual(radixArray?[0].value, 0b0000)
        XCTAssertEqual(radixArray?[1].value, 0b1111)
    }
}
