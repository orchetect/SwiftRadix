//
//  Radix Bytes Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct RadixBytesTests {
    @Test func radix_Bytes() {
        // binary
        
        #expect(
            UInt8(0xFF).binary.bytes ==
            [0xFF]
        )
        
        #expect(
            UInt16(0xFF).binary.bytes ==
            [0xFF, 0x00]
        )
        
        #expect(
            Int(0xFF).binary.bytes ==
            [0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        )
        
        // hex
        
        #expect(
            UInt8(0xFF).hex.bytes ==
            [0xFF]
        )
        
        #expect(
            UInt16(0xFF).hex.bytes ==
            [0xFF, 0x00]
        )
        
        #expect(
            Int(0xFF).hex.bytes ==
            [0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        )
        
        // octal
        
        #expect(
            UInt8(0xFF).octal.bytes ==
            [0xFF]
        )
        
        #expect(
            UInt16(0xFF).octal.bytes ==
            [0xFF, 0x00]
        )
        
        #expect(
            Int(0xFF).octal.bytes ==
            [0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        )
    }
}
