//
//  Radix Bit Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct RadixBitTests {
    @Test func radix_Bit_Get() {
        let source = 0b11001100
        
        // binary
        
        #expect(source.binary.bit(0) == 0b0)
        #expect(source.binary.bit(1) == 0b0)
        #expect(source.binary.bit(2) == 0b1)
        #expect(source.binary.bit(3) == 0b1)
        
        #expect(source.binary[bit: 0] == 0b0)
        #expect(source.binary[bit: 1] == 0b0)
        #expect(source.binary[bit: 2] == 0b1)
        #expect(source.binary[bit: 3] == 0b1)
        
        // hex
        
        #expect(source.hex.bit(0) == 0b0)
        #expect(source.hex.bit(1) == 0b0)
        #expect(source.hex.bit(2) == 0b1)
        #expect(source.hex.bit(3) == 0b1)
        
        #expect(source.hex[bit: 0] == 0b0)
        #expect(source.hex[bit: 1] == 0b0)
        #expect(source.hex[bit: 2] == 0b1)
        #expect(source.hex[bit: 3] == 0b1)
        
        // octal
        
        #expect(source.octal.bit(0) == 0b0)
        #expect(source.octal.bit(1) == 0b0)
        #expect(source.octal.bit(2) == 0b1)
        #expect(source.octal.bit(3) == 0b1)
        
        #expect(source.octal[bit: 0] == 0b0)
        #expect(source.octal[bit: 1] == 0b0)
        #expect(source.octal[bit: 2] == 0b1)
        #expect(source.octal[bit: 3] == 0b1)
        
        // edge cases
        
        #expect(source.hex.bit(-1) == 0) // out of bounds, default 0
        #expect(source.hex.bit(9) == 0)  // out of bounds, default 0
    }
    
    @Test func radix_Bit_Subscript_Set() {
        var radix: Radix<Int>
        
        // binary
        
        radix = 0b11001100.binary
        
        radix[bit: 0] = 1
        
        #expect(radix.value == 0b11001101)
        
        radix[bit: 1] = 1
        
        #expect(radix.value == 0b11001111)
        
        // hex
        
        radix = 0b11001100.hex
        
        radix[bit: 0] = 1
        
        #expect(radix.value == 0b11001101)
        
        radix[bit: 1] = 1
        
        #expect(radix.value == 0b11001111)
        
        // octal
        
        radix = 0b11001100.octal
        
        radix[bit: 0] = 1
        
        #expect(radix.value == 0b11001101)
        
        radix[bit: 1] = 1
        
        #expect(radix.value == 0b11001111)
        
        // edge cases
        
        radix = 0b11001100.hex
        
        radix[bit: 0] = 3 // invalid value, fails silently
        
        #expect(radix.value == 0b11001100)
        
        radix = 0b11001100.hex
        
        radix[bit: -1] = 1 // invalid index, fails silently
        
        #expect(radix.value == 0b11001100)
    }
}
