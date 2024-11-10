//
//  Hex Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct HexTests {
    @Test func hex() {
        // init from int
        
        let hexInt = Hex(0xFF)
        
        #expect(hexInt.value == Int(0xFF))
        #expect(hexInt.base == 16)
        
        // init from string with prefix, default Int value
        
        let hexString1 = Hex("0xFF") // Int default
        
        #expect(hexString1 != nil)
        
        #expect(hexString1?.value.bitWidth == Int.bitWidth)
        #expect(hexString1?.value == Int(0xFF))
        #expect(hexString1?.base == 16)
        
        // init from string without prefix, specifying Int32 value
        
        let hexString2 = Hex("FF", as: Int32.self)
        
        #expect(hexString2 != nil)
        
        #expect(hexString2?.value.bitWidth == Int32.bitWidth)
        #expect(hexString2?.value == Int32(0xFF))
        #expect(hexString2?.base == 16)
    }
    
    @Test func hex_StringFailures() {
        // wrong prefix case
        #expect("0XFF".hex == nil)
        
        // wrong prefix
        #expect("0b1".hex != nil) // this works because it's a valid hex string, without prefix
        #expect("0o1".hex == nil)
        
        // invalid base digits
        #expect("0xZ".hex == nil)
        
        // invalid string altogether
        #expect("$y9_p".hex == nil)
    }
    
    @Test func hex_StringCase() {
        // uppercase
        
        let radix1 = Hex("0xFF")
        
        #expect(radix1 != nil)
        
        #expect(radix1?.value == 0xFF)
        
        // lowercase
        
        let radix2 = Hex("0xff")
        
        #expect(radix2 != nil)
        
        #expect(radix2?.value == 0xFF)
    }
}
