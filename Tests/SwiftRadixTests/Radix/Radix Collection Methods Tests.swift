//
//  Radix Collection Methods Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct RadixCollectionMethodsTests {
    @Test func radix_CollectionExtension_stringValue() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValue ==
            "0 11111111"
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValue ==
            "0 FF"
        )
        
        // octal
        
        let source3 = [0x000.octal, 0o123.octal]
        
        #expect(
            source3.stringValue ==
            "0 123"
        )
    }
    
    @Test func radix_CollectionExtension_stringValue_Prefix() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValue(prefix: true) ==
            "0b0 0b11111111"
        )
        
        #expect(
            source1.stringValue(prefix: false) ==
            "0 11111111"
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValue(prefix: true, uppercase: false) ==
            "0x0 0xff"
        )
        
        #expect(
            source2.stringValue(prefix: false, uppercase: true) ==
            "0 FF"
        )
        
        // octal
        
        let source3 = [0x000.octal, 0o123.octal]
        
        #expect(
            source3.stringValue(prefix: true) ==
            "0o0 0o123"
        )
        
        #expect(
            source3.stringValue(prefix: false) ==
            "0 123"
        )
    }
    
    @Test func radix_CollectionExtension_stringValue_PrefixSeparatorUppercase() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValue(prefix: true, separator: ", ") ==
            "0b0, 0b11111111"
        )
        
        #expect(
            source1.stringValue(prefix: false, separator: ", ") ==
            "0, 11111111"
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValue(prefix: true, separator: ", ", uppercase: false) ==
            "0x0, 0xff"
        )
        
        #expect(
            source2.stringValue(prefix: false, separator: ", ", uppercase: true) ==
            "0, FF"
        )
        
        // octal
        
        let source3 = [0x000.octal, 0o123.octal]
        
        #expect(
            source3.stringValue(prefix: true, separator: ", ") ==
            "0o0, 0o123"
        )
        
        #expect(
            source3.stringValue(prefix: false, separator: ", ") ==
            "0, 123"
        )
    }
    
    @Test func radix_CollectionExtension_stringValue_PadTo() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValue(padTo: 2) ==
            "00 11111111"
        )
        
        #expect(
            source1.stringValue(padTo: 2, prefix: true, separator: ", ") ==
            "0b00, 0b11111111"
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValue(padTo: 2) ==
            "00 FF"
        )
        
        #expect(
            source2.stringValue(padTo: 2, prefix: true, separator: ", ", uppercase: false) ==
            "0x00, 0xff"
        )
        
        // octal
        
        let source3 = [0x000.octal, 0o123.octal]
        
        #expect(
            source3.stringValue(padTo: 2) ==
            "00 123"
        )
        
        #expect(
            source3.stringValue(padTo: 2, prefix: true, separator: ", ") ==
            "0o00, 0o123"
        )
        
        // edge cases
        
        let source4 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source4.stringValue(padTo: -1) ==
            "0 FF"
        )
    }
    
    @Test func radix_CollectionExtension_stringValue_PadToEvery() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValue(padToEvery: 0) ==
            "0 11111111"
        )
        
        #expect(
            source1.stringValue(padToEvery: 2) ==
            "00 11111111"
        )
        
        #expect(
            source1.stringValue(padToEvery: 3) ==
            "000 011111111"
        )
        
        #expect(
            source1.stringValue(padToEvery: 2, prefix: true, separator: ", ") ==
            "0b00, 0b11111111"
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValue(padToEvery: 0) ==
            "0 FF"
        )
        
        #expect(
            source2.stringValue(padToEvery: 2) ==
            "00 FF"
        )
        
        #expect(
            source2.stringValue(padToEvery: 3) ==
            "000 0FF"
        )
        
        #expect(
            source2.stringValue(padToEvery: 2, prefix: true, separator: ", ", uppercase: false) ==
            "0x00, 0xff"
        )
        
        // octal
        
        let source3 = [0x000.octal, 0o123.octal]
        
        #expect(
            source3.stringValue(padToEvery: 0) ==
            "0 123"
        )
        
        #expect(
            source3.stringValue(padToEvery: 2) ==
            "00 0123"
        )
        
        #expect(
            source3.stringValue(padToEvery: 3) ==
            "000 123"
        )
        
        #expect(
            source3.stringValue(padToEvery: 5) ==
            "00000 00123"
        )
        
        #expect(
            source3.stringValue(padToEvery: 2, prefix: true, separator: ", ") ==
            "0o00, 0o0123"
        )
        
        // edge cases
        
        let source4 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source4.stringValue(padToEvery: -1) ==
            "0 FF"
        )
    }
    
    @Test func radix_CollectionExtension_stringValueArrayLiteral() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValueArrayLiteral ==
            "[0b0, 0b11111111]"
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValueArrayLiteral ==
            "[0x0, 0xFF]"
        )
        
        // octal
        
        let source3 = [0o000.octal, 0o123.octal]
        
        #expect(
            source3.stringValueArrayLiteral ==
            "[0o0, 0o123]"
        )
    }
    
    @Test func radix_CollectionExtension_stringValueArrayLiteral_PadTo() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValueArrayLiteral(padTo: 4) ==
            "[0b0000, 0b11111111]"
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValueArrayLiteral(padTo: 4, uppercase: true) ==
            "[0x0000, 0x00FF]"
        )
        
        #expect(
            source2.stringValueArrayLiteral(padTo: 4, uppercase: false) ==
            "[0x0000, 0x00ff]"
        )
        
        // octal
        
        let source3 = [0o000.octal, 0o123.octal]
        
        #expect(
            source3.stringValueArrayLiteral(padTo: 4) ==
            "[0o0000, 0o0123]"
        )
    }
    
    @Test func radix_CollectionExtension_stringValueArrayLiteral_PadToEvery() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValueArrayLiteral(padToEvery: 2) ==
            "[0b00, 0b11111111]"
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValueArrayLiteral(padToEvery: 2, uppercase: true) ==
            "[0x00, 0xFF]"
        )
        
        #expect(
            source2.stringValueArrayLiteral(padToEvery: 2, uppercase: false) ==
            "[0x00, 0xff]"
        )
        
        // octal
        
        let source3 = [0o000.octal, 0o123.octal]
        
        #expect(
            source3.stringValueArrayLiteral(padToEvery: 2) ==
            "[0o00, 0o0123]"
        )
    }
    
    @Test func radix_CollectionExtension_stringValues() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValues ==
            ["0", "11111111"]
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValues ==
            ["0", "FF"]
        )
        
        // octal
        
        let source3 = [0o000.octal, 0o123.octal]
        
        #expect(
            source3.stringValues ==
            ["0", "123"]
        )
    }
    
    @Test func radix_CollectionExtension_stringValues_PadTo() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValues(padTo: 0) ==
            ["0", "11111111"]
        )
        
        #expect(
            source1.stringValues(padTo: 2) ==
            ["00", "11111111"]
        )
        
        #expect(
            source1.stringValues(padTo: 3) ==
            ["000", "11111111"]
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValues(padTo: 0) ==
            ["0", "FF"]
        )
        
        #expect(
            source2.stringValues(padTo: 2) ==
            ["00", "FF"]
        )
        
        #expect(
            source2.stringValues(padTo: 3, uppercase: false) ==
            ["000", "0ff"]
        )
        
        // octal
        
        let source3 = [0o000.octal, 0o123.octal]
        
        #expect(
            source3.stringValues(padTo: 0) ==
            ["0", "123"]
        )
        
        #expect(
            source3.stringValues(padTo: 2) ==
            ["00", "123"]
        )
        
        #expect(
            source3.stringValues(padTo: 3) ==
            ["000", "123"]
        )
        
        #expect(
            source3.stringValues(padTo: 5) ==
            ["00000", "00123"]
        )
    }
    
    @Test func radix_CollectionExtension_stringValues_PadToEvery() {
        // binary
        
        let source1 = [0x00.binary, 0xFF.binary]
        
        #expect(
            source1.stringValues(padToEvery: 0) ==
            ["0", "11111111"]
        )
        
        #expect(
            source1.stringValues(padToEvery: 2) ==
            ["00", "11111111"]
        )
        
        #expect(
            source1.stringValues(padToEvery: 3) ==
            ["000", "011111111"]
        )
        
        // hex
        
        let source2 = [0x00.hex, 0xFF.hex]
        
        #expect(
            source2.stringValues(padToEvery: 0) ==
            ["0", "FF"]
        )
        
        #expect(
            source2.stringValues(padToEvery: 2) ==
            ["00", "FF"]
        )
        
        #expect(
            source2.stringValues(padToEvery: 3) ==
            ["000", "0FF"]
        )
        
        #expect(
            source2.stringValues(padToEvery: 2, prefixes: true, uppercase: false) ==
            ["0x00", "0xff"]
        )
        
        let source2B = [0x00.hex, 0xFFFF.hex]
        
        #expect(
            source2B.stringValues(padToEvery: 0) ==
            ["0", "FFFF"]
        )
        
        #expect(
            source2B.stringValues(padToEvery: 2) ==
            ["00", "FFFF"]
        )
        
        #expect(
            source2B.stringValues(padToEvery: 3) ==
            ["000", "00FFFF"]
        )
        
        #expect(
            source2B.stringValues(padToEvery: 3, prefixes: true, uppercase: false) ==
            ["0x000", "0x00ffff"]
        )
        
        // octal
        
        let source3 = [0o000.octal, 0o123.octal]
        
        #expect(
            source3.stringValues(padToEvery: 0) ==
            ["0", "123"]
        )
        
        #expect(
            source3.stringValues(padToEvery: 2) ==
            ["00", "0123"]
        )
        
        #expect(
            source3.stringValues(padToEvery: 3) ==
            ["000", "123"]
        )
        
        #expect(
            source3.stringValues(padToEvery: 5) ==
            ["00000", "00123"]
        )
    }
    
    @Test func radix_CollectionExtension_values() {
        // binary
        
        let source1: [Radix<Int>]
            = [0x00.binary, 0xFF.binary]
        
        #expect(source1.values == [0x00, 0xFF])
        
        // hex
        
        let source2: [Radix<Int>]
            = [0x00.hex, 0xFF.hex]
        
        #expect(source2.values == [0x00, 0xFF])
        
        // octal
        
        let source3: [Radix<Int>]
            = [0x00.octal, 0xFF.octal]
        
        #expect(source3.values == [0x00, 0xFF])
    }
    
    @Test func radix_CollectionExtension_Optional_values() {
        // binary
        
        let source1: [Radix<Int>?]
            = [0x00.binary, 0xFF.binary, nil]
        
        #expect(source1.values == [0x00, 0xFF, nil])
        
        // hex
        
        let source2: [Radix<Int>?]
            = [0x00.hex, 0xFF.hex, nil]
        
        #expect(source2.values == [0x00, 0xFF, nil])
        
        // octal
        
        let source3: [Radix<Int>?]
            = [0x00.octal, 0xFF.octal, nil]
        
        #expect(source3.values == [0x00, 0xFF, nil])
    }
}
