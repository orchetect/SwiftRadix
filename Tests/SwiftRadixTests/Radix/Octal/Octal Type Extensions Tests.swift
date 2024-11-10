//
//  Octal Type Extensions Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation
import SwiftRadix
import Testing

@Suite struct OctalTypeExtensionsTests {
    @Test func octal_TypeExtensions_BinaryInteger() {
        let validString = "123"
        
        #expect(0o123.octal.stringValue == validString)
        #expect(UInt(0o123).octal.stringValue == validString)
        #expect(Int8(0o123).octal.stringValue == validString)
        #expect(UInt8(0o123).octal.stringValue == validString)
        #expect(Int16(0o123).octal.stringValue == validString)
        #expect(UInt16(0o123).octal.stringValue == validString)
        #expect(Int32(0o123).octal.stringValue == validString)
        #expect(UInt32(0o123).octal.stringValue == validString)
        #expect(Int64(0o123).octal.stringValue == validString)
        #expect(UInt64(0o123).octal.stringValue == validString)
    }
    
    @Test func octal_TypeExtensions_String() {
        let validValue = 0o123
        
        let radix1 = "0o123".octal // Int default
        
        #expect(radix1 != nil)
        
        #expect(radix1?.value == Int(validValue))
        
        let radix2 = "123".octal // Int default
        
        #expect(radix2 != nil)
        
        #expect(radix2?.value == Int(validValue))
        
        let radix3 = "123".octal(as: Int32.self)
        
        #expect(radix3 != nil)
        
        #expect(radix3?.value == Int32(validValue))
    }
    
    @Test func octal_TypeExtensions_StringArray() {
        let source = ["000", "0o123"]
        
        let radixArray1 = source.octal // Int default
        
        #expect(radixArray1.count == 2)
        
        #expect(radixArray1[0]?.value == 0x000)
        #expect(radixArray1[1]?.value == 0o123)
        
        let radixArray2 = source.octal(as: Int32.self)
        
        #expect(radixArray2.count == 2)
        
        #expect(radixArray2[0]?.value == Int32(0x000))
        #expect(radixArray2[1]?.value == Int32(0o123))
    }
    
    @Test func octal_TypeExtensions_BinIntCollection() {
        let source = [0o000, 0o123]
        
        let radixArray = source.octal
        
        #expect(radixArray.count == 2)
        
        #expect(radixArray[0].value == 0x000)
        #expect(radixArray[1].value == 0o123)
    }
    
    @Test func octal_TypeExtensions_Data() {
        let source = Data([0o000, 0o123])
        
        let radixArray = source.octal
        
        #expect(radixArray.count == 2)
        
        #expect(radixArray[0].value == 0x000)
        #expect(radixArray[1].value == 0o123)
    }
}
