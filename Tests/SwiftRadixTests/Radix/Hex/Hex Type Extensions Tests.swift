//
//  Hex Type Extensions Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import XCTest
import SwiftRadix

final class HexTypeExtensionsTests: XCTestCase {
    func testHex_TypeExtensions_BinaryInteger() {
        let validString = "7F"
        
        XCTAssertEqual(0x7F.hex.stringValue, validString)
        XCTAssertEqual(UInt(0x7F).hex.stringValue, validString)
        XCTAssertEqual(Int8(0x7F).hex.stringValue, validString)
        XCTAssertEqual(UInt8(0x7F).hex.stringValue, validString)
        XCTAssertEqual(Int16(0x7F).hex.stringValue, validString)
        XCTAssertEqual(UInt16(0x7F).hex.stringValue, validString)
        XCTAssertEqual(Int32(0x7F).hex.stringValue, validString)
        XCTAssertEqual(UInt32(0x7F).hex.stringValue, validString)
        XCTAssertEqual(Int64(0x7F).hex.stringValue, validString)
        XCTAssertEqual(UInt64(0x7F).hex.stringValue, validString)
    }
    
    func testHex_TypeExtensions_String() {
        let validValue = 0xFF
        
        let radix1 = "0xFF".hex // Int default
        
        XCTAssertNotNil(radix1)
        
        XCTAssertEqual(radix1?.value, Int(validValue))
        
        let radix2 = "FF".hex // Int default
        
        XCTAssertNotNil(radix2)
        
        XCTAssertEqual(radix2?.value, Int(validValue))
        
        let radix3 = "FF".hex(as: Int32.self)
        
        XCTAssertNotNil(radix3)
        
        XCTAssertEqual(radix3?.value, Int32(validValue))
    }
    
    func testHex_TypeExtensions_StringArray() {
        let source = ["00", "0xFF"]
        
        let radixArray1 = source.hex // Int default
        
        XCTAssertEqual(radixArray1.count, 2)
        
        XCTAssertEqual(radixArray1[0]?.value, 0x00)
        XCTAssertEqual(radixArray1[1]?.value, 0xFF)
        
        let radixArray2 = source.hex(as: Int32.self)
        
        XCTAssertEqual(radixArray2.count, 2)
        
        XCTAssertEqual(radixArray2[0]?.value, Int32(0x00))
        XCTAssertEqual(radixArray2[1]?.value, Int32(0xFF))
    }
    
    func testHex_TypeExtensions_BinIntCollection() {
        let source = [0x00, 0xFF]
        
        let radixArray = source.hex
        
        XCTAssertEqual(radixArray.count, 2)
        
        XCTAssertEqual(radixArray[0].value, 0x00)
        XCTAssertEqual(radixArray[1].value, 0xFF)
    }
    
    func testHex_TypeExtensions_Data() {
        let source = Data([0x00, 0xFF])
        
        let radixArray = source.hex
        
        XCTAssertEqual(radixArray.count, 2)
        
        XCTAssertEqual(radixArray[0].value, 0x00)
        XCTAssertEqual(radixArray[1].value, 0xFF)
    }
}
