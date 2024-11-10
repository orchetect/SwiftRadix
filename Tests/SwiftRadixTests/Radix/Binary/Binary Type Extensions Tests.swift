//
//  Binary Type Extensions Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation
import SwiftRadix
import Testing

@Suite struct BinaryTypeExtensionsTests {
    @Test func binary_TypeExtensions_BinaryInteger() {
        let validString = "1100"
        
        #expect(0b1100.binary.stringValue == validString)
        #expect(UInt(0b1100).binary.stringValue == validString)
        #expect(Int8(0b1100).binary.stringValue == validString)
        #expect(UInt8(0b1100).binary.stringValue == validString)
        #expect(Int16(0b1100).binary.stringValue == validString)
        #expect(UInt16(0b1100).binary.stringValue == validString)
        #expect(Int32(0b1100).binary.stringValue == validString)
        #expect(UInt32(0b1100).binary.stringValue == validString)
        #expect(Int64(0b1100).binary.stringValue == validString)
        #expect(UInt64(0b1100).binary.stringValue == validString)
    }
    
    @Test func binary_TypeExtensions_String() {
        let validValue = 0b1100
        
        let radix1 = "0b1100".binary // Int default
        
        #expect(radix1 != nil)
        
        #expect(radix1?.value == Int(validValue))
        
        let radix2 = "1100".binary // Int default
        
        #expect(radix2 != nil)
        
        #expect(radix2?.value == Int(validValue))
        
        let radix3 = "1100".binary(as: Int32.self)
        
        #expect(radix3 != nil)
        
        #expect(radix3?.value == Int32(validValue))
    }
    
    @Test func binary_TypeExtensions_StringArray() {
        let source = ["0000", "0b1111"]
        
        let radixArray1 = source.binary // Int default
        
        #expect(radixArray1.count == 2)
        
        #expect(radixArray1[0]?.value == 0b0000)
        #expect(radixArray1[1]?.value == 0b1111)
        
        let radixArray2 = source.binary(as: Int32.self)
        
        #expect(radixArray2.count == 2)
        
        #expect(radixArray2[0]?.value == Int32(0b0000))
        #expect(radixArray2[1]?.value == Int32(0b1111))
    }
    
    @Test func binary_TypeExtensions_BinIntCollection() {
        let source = [0b0000, 0b1111]
        
        let radixArray1 = source.binary
        
        #expect(radixArray1.count == 2)
        
        #expect(radixArray1[0].value == 0b0000)
        #expect(radixArray1[1].value == 0b1111)
    }
    
    @Test func binary_TypeExtensions_Data() {
        let source = Data([0b0000, 0b1111])
        
        let radixArray = source.binary
        
        #expect(radixArray.count == 2)
        
        #expect(radixArray[0].value == 0b0000)
        #expect(radixArray[1].value == 0b1111)
    }
}
