//
//  Binary Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct BinaryTests {
    @Test func binary() {
        // init from int
        
        let binaryInt = Binary(0b1100)
        
        #expect(binaryInt.value == Int(0b1100))
        #expect(binaryInt.base == 2)
        
        // init from string with prefix, default Int value
        
        let binaryString1 = Binary("0b1100") // Int default
        
        #expect(binaryString1 != nil)
        
        #expect(binaryString1?.value.bitWidth == Int.bitWidth)
        #expect(binaryString1?.value == Int(0b1100))
        #expect(binaryString1?.base == 2)
        
        // init from string without prefix, specifying Int32 value
        
        let binaryString2 = Binary("1100", as: Int32.self)
        
        #expect(binaryString2 != nil)
        
        #expect(binaryString2?.value.bitWidth == Int32.bitWidth)
        #expect(binaryString2?.value == Int32(0b1100))
        #expect(binaryString2?.base == 2)
    }
    
    @Test func binary_StringFailures() {
        // wrong prefix case
        #expect("0B10".binary == nil)
        
        // wrong prefix
        #expect("0x1".binary == nil)
        #expect("0o1".binary == nil)
        
        // invalid base digits
        #expect("0b2".binary == nil)
        
        // invalid string altogether
        #expect(#"$y9_p"#.binary == nil)
    }
}
