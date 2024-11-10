//
//  Hex Type Extensions Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation
import SwiftRadix
import Testing

@Suite struct HexTypeExtensionsTests {
    @Test func hex_TypeExtensions_BinaryInteger() {
        let validString = "7F"
        
        #expect(0x7F.hex.stringValue == validString)
        #expect(UInt(0x7F).hex.stringValue == validString)
        #expect(Int8(0x7F).hex.stringValue == validString)
        #expect(UInt8(0x7F).hex.stringValue == validString)
        #expect(Int16(0x7F).hex.stringValue == validString)
        #expect(UInt16(0x7F).hex.stringValue == validString)
        #expect(Int32(0x7F).hex.stringValue == validString)
        #expect(UInt32(0x7F).hex.stringValue == validString)
        #expect(Int64(0x7F).hex.stringValue == validString)
        #expect(UInt64(0x7F).hex.stringValue == validString)
    }
    
    @Test func hex_TypeExtensions_String() {
        let validValue = 0xFF
        
        let radix1 = "0xFF".hex // Int default
        
        #expect(radix1 != nil)
        
        #expect(radix1?.value == Int(validValue))
        
        let radix2 = "FF".hex // Int default
        
        #expect(radix2 != nil)
        
        #expect(radix2?.value == Int(validValue))
        
        let radix3 = "FF".hex(as: Int32.self)
        
        #expect(radix3 != nil)
        
        #expect(radix3?.value == Int32(validValue))
    }
    
    @Test func hex_TypeExtensions_StringArray() {
        let source = ["00", "0xFF"]
        
        let radixArray1 = source.hex // Int default
        
        #expect(radixArray1.count == 2)
        
        #expect(radixArray1[0]?.value == 0x00)
        #expect(radixArray1[1]?.value == 0xFF)
        
        let radixArray2 = source.hex(as: Int32.self)
        
        #expect(radixArray2.count == 2)
        
        #expect(radixArray2[0]?.value == Int32(0x00))
        #expect(radixArray2[1]?.value == Int32(0xFF))
    }
    
    @Test func hex_TypeExtensions_BinIntCollection() {
        let source = [0x00, 0xFF]
        
        let radixArray = source.hex
        
        #expect(radixArray.count == 2)
        
        #expect(radixArray[0].value == 0x00)
        #expect(radixArray[1].value == 0xFF)
    }
    
    @Test func hex_TypeExtensions_Data() {
        let source = Data([0x00, 0xFF])
        
        let radixArray = source.hex
        
        #expect(radixArray.count == 2)
        
        #expect(radixArray[0].value == 0x00)
        #expect(radixArray[1].value == 0xFF)
    }
}
