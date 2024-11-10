//
//  Radix Nibble Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct RadixNibbleTests {
    @Test func radix_Nibble_Get() {
        let source = 0b01011100
        
        // binary
        
        #expect(source.binary.nibble(0) == 0b1100)
        #expect(source.binary.nibble(1) == 0b0101)
        
        #expect(source.binary[nibble: 0] == 0b1100)
        #expect(source.binary[nibble: 1] == 0b0101)
        
        // hex
        
        #expect(source.hex.nibble(0) == 0b1100)
        #expect(source.hex.nibble(1) == 0b0101)
        
        #expect(source.hex[nibble: 0] == 0b1100)
        #expect(source.hex[nibble: 1] == 0b0101)
        
        // octal
        
        #expect(source.octal.nibble(0) == 0b1100)
        #expect(source.octal.nibble(1) == 0b0101)
        
        #expect(source.octal[nibble: 0] == 0b1100)
        #expect(source.octal[nibble: 1] == 0b0101)
        
        // edge cases
        
        #expect(source.binary.nibble(-1) == 0) // out of bounds, default 0
        #expect(source.binary.nibble(2) == 0)  // out of bounds, default 0
    }
    
    @Test func radix_Nibble_Subscript_Set() {
        var radix: Radix<Int>
        
        // binary
        
        radix = 0b01011100.binary
        
        radix[nibble: 0] = 0b0110
        
        #expect(radix.value == 0b01010110)
        
        radix[nibble: 1] = 0b0110
        
        #expect(radix.value == 0b01100110)
        
        // hex
        
        radix = 0b01011100.hex
        
        radix[nibble: 0] = 0b0110
        
        #expect(radix.value == 0b01010110)
        
        radix[nibble: 1] = 0b0110
        
        #expect(radix.value == 0b01100110)
        
        // octal
        
        radix = 0b01011100.octal
        
        radix[nibble: 0] = 0b0110
        
        #expect(radix.value == 0b01010110)
        
        radix[nibble: 1] = 0b0110
        
        #expect(radix.value == 0b01100110)
        
        // edge cases
        
        radix = 0b01011100.hex
        
        radix[nibble: 0] = 20 // invalid value, fails silently
        
        #expect(radix.value == 0b01011100)
        
        radix[nibble: -1] = 1 // invalid index, fails silently
        
        #expect(radix.value == 0b01011100)
    }
}
