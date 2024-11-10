//
//  Radix Protocol Adoptions Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct RadixProtocolAdoptionsTests {
    @Test func radix_CustomStringConvertible() {
        // CustomStringConvertible
        
        // binary
        
        #expect(
            String(describing: 1.binary) ==
            "0b1"
        )
        #expect(
            1.binary.description ==
            "0b1"
        )
        
        // hex
        
        #expect(
            String(describing: 1.hex) ==
            "0x1"
        )
        #expect(
            1.hex.description ==
            "0x1"
        )
        
        // octal
        
        #expect(
            String(describing: 1.octal) ==
            "0o1"
        )
        #expect(
            1.octal.description ==
            "0o1"
        )
        
        // CustomDebugStringConvertible
        
        // binary
        
        #expect(
            1.binary.debugDescription ==
            "Radix<Int>(0b1)"
        )
        
        // hex
        
        #expect(
            1.hex.debugDescription ==
            "Radix<Int>(0x1)"
        )
        
        // octal
        
        #expect(
            1.octal.debugDescription ==
            "Radix<Int>(0o1)"
        )
    }
    
    @Test func radix_Hashable() {
        // Dictionary - [Key : Hashable]
        
        var dict: [String: Radix<Int>] = [:]
        
        dict.updateValue(1.hex, forKey: "value1")
        
        #expect(dict["value1"]!.value == 1)
        
        // Set - Hashable
        
        var set: Set = [1.hex]
        
        set.update(with: 1.hex)
        
        #expect(set.count == 1) // should recognize the dupe was not added
        
        set.update(with: 2.hex)
        
        #expect(set.count == 2)
    }
}
