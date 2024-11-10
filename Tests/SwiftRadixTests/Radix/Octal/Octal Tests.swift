//
//  Octal Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct OctalTests {
    @Test func octal() {
        // init from int
        
        let octalInt = Octal(0o123)
        
        #expect(octalInt.value == Int(0o123))
        #expect(octalInt.base == 8)
        
        // init from string with prefix, default Int value
        
        let octalString1 = Octal("0o123") // Int default
        
        #expect(octalString1 != nil)
        
        #expect(octalString1?.value.bitWidth == Int.bitWidth)
        #expect(octalString1?.value == Int(0o123))
        #expect(octalString1?.base == 8)
        
        // init from string without prefix, specifying Int32 value
        
        let octalString2 = Octal("123", as: Int32.self)
        
        #expect(octalString2 != nil)
        
        #expect(octalString2?.value.bitWidth == Int32.bitWidth)
        #expect(octalString2?.value == Int32(0o123))
        #expect(octalString2?.base == 8)
    }
    
    @Test func octal_StringFailures() {
        // wrong prefix case
        #expect("0O10".octal == nil)
        
        // wrong prefix
        #expect("0b1".octal == nil)
        #expect("0x1".octal == nil)
        
        // invalid base digits
        #expect("0o8".octal == nil)
        
        // invalid string altogether
        #expect("$y9_p".octal == nil)
    }
}
