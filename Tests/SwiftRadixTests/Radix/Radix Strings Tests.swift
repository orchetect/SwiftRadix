//
//  Radix Strings Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct RadixStringsTests {
    @Test func radix_stringValue_Get() {
        // binary
        
        #expect(0b0.binary.stringValue == "0")
        #expect(0b11001100.binary.stringValue == "11001100")
        
        // hex
        
        #expect(0x00.hex.stringValue == "0")
        #expect(0xFF.hex.stringValue == "FF")
        
        // octal
        
        #expect(0x000.octal.stringValue == "0")
        #expect(0o123.octal.stringValue == "123")
    }
    
    @Test func radix_stringValue_Get_Extents() {
        // binary
        
        #expect(
            UInt.max.binary.stringValue ==
            "1111111111111111111111111111111111111111111111111111111111111111"
        )
        
        // hex
        
        #expect(
            UInt.max.hex.stringValue ==
            "FFFFFFFFFFFFFFFF"
        )
        
        // octal
        
        #expect(
            UInt.max.octal.stringValue ==
            "1777777777777777777777"
        )
    }
    
    @Test func radix_stringValue_Set() {
        // binary
        
        var source1 = 0b0.binary
        
        source1.stringValue = "11001100"     // no prefix
        #expect(source1.value == 0b11001100)
        
        source1.stringValue = "0b00110011"   // with prefix
        #expect(source1.value == 0b00110011)
        
        // hex
        
        var source2 = 0x00.hex
        
        source2.stringValue = "FF"           // no prefix
        #expect(source2.value == 0xFF)
        
        source2.stringValue = "0xFFFF"       // with prefix
        #expect(source2.value == 0xFFFF)
        
        // octal
        
        var source3 = 0o0.octal
        
        source3.stringValue = "123"          // no prefix
        #expect(source3.value == 0o123)
        
        source3.stringValue = "0o1234"       // with prefix
        #expect(source3.value == 0o1234)
    }
    
    @Test func radix_stringValue_Set_Extents() {
        // binary
        
        var source1 = UInt(0b0).binary
        
        source1.stringValue = "1111111111111111111111111111111111111111111111111111111111111111"
        
        #expect(source1.value == UInt.max)
        
        // hex
        
        var source2 = UInt(0x00).hex
        
        source2.stringValue = "FFFFFFFFFFFFFFFF"
        
        #expect(source2.value == UInt.max)
        
        // octal
        
        var source3 = UInt(0o0).octal
        
        source3.stringValue = "1777777777777777777777"
        
        #expect(source3.value == UInt.max)
    }
    
    @Test func radix_stringValue_Set_Extents_EdgeCases() {
        // binary
        
        var source1 = 0b0.binary
        
        source1.stringValue = "1111111111111111111111111111111111111111111111111111111111111111"
        
        #expect(source1.value == 0) // string overflowed Int, set silently fails
        
        // hex
        
        var source2 = 0x00.hex
        
        source2.stringValue = "FFFFFFFFFFFFFFFF"
        
        #expect(source2.value == 0) // string overflowed Int, set silently fails
        
        // octal
        
        var source3 = 0o0.octal
        
        source3.stringValue = "1777777777777777777777"
        
        #expect(source3.value == 0) // string overflowed Int, set silently fails
    }
    
    @Test func radix_stringValue_Prefix() {
        // binary
        
        #expect(0b0.binary.stringValue(prefix: true) == "0b0")
        #expect(0b0.binary.stringValue(prefix: false) == "0")
        
        // hex
        
        // uppercase
        #expect(0b0.hex.stringValue(prefix: true) == "0x0")
        #expect(0b0.hex.stringValue(prefix: false) == "0")
        
        // lowercase
        #expect(0xF.hex.stringValue(prefix: true, uppercase: false) == "0xf")
        #expect(0xF.hex.stringValue(prefix: false, uppercase: false) == "f")
        
        // octal
        
        #expect(0o0.octal.stringValue(prefix: true) == "0o0")
        #expect(0o0.octal.stringValue(prefix: false) == "0")
    }
    
    @Test func radix_stringValue_PadTo() {
        // binary
        
        let source1 = 0b00000111.binary
        
        #expect(source1.stringValue(padTo: 0) == "111")
        #expect(source1.stringValue(padTo: 1) == "111")
        #expect(source1.stringValue(padTo: 2) == "111")
        #expect(source1.stringValue(padTo: 6) == "000111")
        
        #expect(source1.stringValue(padTo: 2, prefix: true) == "0b111")
        #expect(source1.stringValue(padTo: 6, prefix: true) == "0b000111")
        
        // edge cases
        #expect(source1.stringValue(padTo: -1) == "111")
        
        // hex
        
        let source2 = 0x0F.hex
        
        // uppercase
        #expect(source2.stringValue(padTo: 0) == "F")
        #expect(source2.stringValue(padTo: 1) == "F")
        #expect(source2.stringValue(padTo: 2) == "0F")
        #expect(source2.stringValue(padTo: 6) == "00000F")
        #expect(source2.stringValue(padTo: 2, prefix: true) == "0x0F")
        
        // lowercase
        #expect(source2.stringValue(padTo: 0, uppercase: false) == "f")
        #expect(source2.stringValue(padTo: 1, uppercase: false) == "f")
        #expect(source2.stringValue(padTo: 2, uppercase: false) == "0f")
        #expect(source2.stringValue(padTo: 6, uppercase: false) == "00000f")
        #expect(source2.stringValue(padTo: 2, prefix: true, uppercase: false) == "0x0f")
        
        // edge cases
        #expect(source2.stringValue(padTo: -1) == "F")
        
        // octal
        
        let source3 = 0o17.octal
        
        #expect(source3.stringValue(padTo: 0) == "17")
        #expect(source3.stringValue(padTo: 1) == "17")
        #expect(source3.stringValue(padTo: 2) == "17")
        #expect(source3.stringValue(padTo: 6) == "000017")
        
        #expect(source3.stringValue(padTo: 2, prefix: true) == "0o17")
        
        // edge cases
        #expect(source3.stringValue(padTo: -1) == "17")
    }
    
    @Test func radix_stringValue_PadTo_EdgeCases() {
        // ensure padding of 0 or a negative value defaults to an internal padding of 1
        
        // binary
        
        #expect(0b0.binary.stringValue(padTo: -1) == "0")
        #expect(0b0.binary.stringValue(padTo: 0) == "0")
        
        // hex
        
        #expect(0x0.hex.stringValue(padTo: -1) == "0")
        #expect(0x0.hex.stringValue(padTo: 0) == "0")
        
        // octal
        
        #expect(0o0.hex.stringValue(padTo: -1) == "0")
        #expect(0o0.hex.stringValue(padTo: 0) == "0")
    }
    
    @Test func radix_stringValue_PadTo_SplitEvery() {
        // binary
        
        let source1 = 0b00000111.binary
        
        #expect(source1.stringValue(padTo: 0, splitEvery: 0) == "111")
        #expect(source1.stringValue(padTo: 1, splitEvery: 1) == "1 1 1")
        #expect(source1.stringValue(padTo: 1, splitEvery: 2) == "1 11")
        #expect(source1.stringValue(padTo: 2, splitEvery: 2) == "1 11")
        #expect(source1.stringValue(padTo: 4, splitEvery: 3) == "0 111")
        
        // prefix treats it as a Swift Integer Literal, inserting underscores for splits
        #expect(source1.stringValue(padTo: 8, splitEvery: 2, prefix: true) == "0b00_00_01_11")
        
        // edge cases
        #expect(source1.stringValue(padTo: 2, splitEvery: -1) == "111")
        
        // hex
        
        let source2 = 0xF0F.hex
        
        // uppercase
        #expect(source2.stringValue(padTo: 0, splitEvery: 0) == "F0F")
        #expect(source2.stringValue(padTo: 1, splitEvery: 1) == "F 0 F")
        #expect(source2.stringValue(padTo: 2, splitEvery: 2) == "F 0F")
        #expect(source2.stringValue(padTo: 8, splitEvery: 3) == "00 000 F0F")
        // (prefix treats it as a Swift Integer Literal, inserting underscores for splits)
        #expect(source2.stringValue(padTo: 8, splitEvery: 2, prefix: true) == "0x00_00_0F_0F")
        
        // lowercase
        #expect(source2.stringValue(padTo: 0, splitEvery: 0, uppercase: false) == "f0f")
        #expect(source2.stringValue(padTo: 1, splitEvery: 1, uppercase: false) == "f 0 f")
        #expect(source2.stringValue(padTo: 2, splitEvery: 2, uppercase: false) == "f 0f")
        #expect(source2.stringValue(padTo: 8, splitEvery: 3, uppercase: false) == "00 000 f0f")
        // (prefix treats it as a Swift Integer Literal, inserting underscores for splits)
        #expect(
            source2.stringValue(padTo: 8, splitEvery: 2, prefix: true, uppercase: false) ==
            "0x00_00_0f_0f"
        )
        
        // edge cases
        #expect(source2.stringValue(padTo: 2, splitEvery: -1) == "F0F")
        
        // octal
        
        let source3 = 0o7.octal
        
        #expect(source3.stringValue(padTo: 0, splitEvery: 0) == "7")
        #expect(source3.stringValue(padTo: 1, splitEvery: 1) == "7")
        #expect(source3.stringValue(padTo: 2, splitEvery: 2) == "07")
        #expect(source3.stringValue(padTo: 4, splitEvery: 3) == "0 007")
        
        // prefix treats it as a Swift Integer Literal, inserting underscores for splits
        #expect(source3.stringValue(padTo: 2, splitEvery: 2, prefix: true) == "0o07")
        
        // edge cases
        #expect(source3.stringValue(padTo: 2, splitEvery: -1) == "07")
    }
    
    @Test func radix_stringValue_PadToEvery() {
        // binary
        
        let source1 = 0b00011111.binary
        
        #expect(source1.stringValue(padToEvery: 0) == "11111")
        #expect(source1.stringValue(padToEvery: 1) == "11111")
        #expect(source1.stringValue(padToEvery: 2) == "011111")
        #expect(source1.stringValue(padToEvery: 4) == "00011111")
        
        #expect(source1.stringValue(padToEvery: 2, prefix: true) == "0b011111")
        
        // edge cases
        #expect(source1.stringValue(padToEvery: -1) == "11111")
        
        // hex
        
        let source2 = 0xFFF.hex
        
        // uppercase
        #expect(source2.stringValue(padToEvery: 0) == "FFF")
        #expect(source2.stringValue(padToEvery: 1) == "FFF")
        #expect(source2.stringValue(padToEvery: 2) == "0FFF")
        #expect(source2.stringValue(padToEvery: 6) == "000FFF")
        #expect(source2.stringValue(padToEvery: 2, prefix: true) == "0x0FFF")
        
        // lowercase
        #expect(source2.stringValue(padToEvery: 0, uppercase: false) == "fff")
        #expect(source2.stringValue(padToEvery: 1, uppercase: false) == "fff")
        #expect(source2.stringValue(padToEvery: 2, uppercase: false) == "0fff")
        #expect(source2.stringValue(padToEvery: 6, uppercase: false) == "000fff")
        #expect(source2.stringValue(padToEvery: 2, prefix: true, uppercase: false) == "0x0fff")
        
        // edge cases
        #expect(source2.stringValue(padToEvery: -1) == "FFF")
        
        // octal
        
        let source3 = 0o123456.octal
        
        #expect(source3.stringValue(padToEvery: 0) == "123456")
        #expect(source3.stringValue(padToEvery: 1) == "123456")
        #expect(source3.stringValue(padToEvery: 2) == "123456")
        #expect(source3.stringValue(padToEvery: 4) == "00123456")
        
        #expect(source3.stringValue(padToEvery: 2, prefix: true) == "0o123456")
        
        // edge cases
        #expect(source3.stringValue(padToEvery: -1) == "123456")
    }
    
    @Test func radix_stringValue_PadToEvery_SplitEvery() {
        // binary
        
        let source1 = 0b00011111.binary
        
        #expect(source1.stringValue(padToEvery: 0, splitEvery: 0) == "11111")
        #expect(source1.stringValue(padToEvery: 1, splitEvery: 1) == "1 1 1 1 1")
        #expect(source1.stringValue(padToEvery: 1, splitEvery: 2) == "1 11 11")
        #expect(source1.stringValue(padToEvery: 2, splitEvery: 2) == "01 11 11")
        #expect(source1.stringValue(padToEvery: 4, splitEvery: 3) == "00 011 111")
        
        // prefix treats it as a Swift Integer Literal, inserting underscores for splits
        #expect(
            source1.stringValue(padToEvery: 2, splitEvery: 2, prefix: true) ==
            "0b01_11_11"
        )
        
        // edge cases
        #expect(source1.stringValue(padToEvery: 2, splitEvery: -1) == "011111")
        
        // hex
        
        let source2 = 0xFFF.hex
        
        // uppercase
        #expect(source2.stringValue(padToEvery: 0, splitEvery: 0) == "FFF")
        #expect(source2.stringValue(padToEvery: 1, splitEvery: 1) == "F F F")
        #expect(source2.stringValue(padToEvery: 2, splitEvery: 2) == "0F FF")
        #expect(source2.stringValue(padToEvery: 8, splitEvery: 3) == "00 000 FFF")
        // (prefix treats it as a Swift Integer Literal, inserting underscores for splits)
        #expect(source2.stringValue(padToEvery: 2, splitEvery: 2, prefix: true) == "0x0F_FF")
        
        // lowercase
        #expect(source2.stringValue(padToEvery: 0, splitEvery: 0, uppercase: false) == "fff")
        #expect(source2.stringValue(padToEvery: 1, splitEvery: 1, uppercase: false) == "f f f")
        #expect(source2.stringValue(padToEvery: 2, splitEvery: 2, uppercase: false) == "0f ff")
        #expect(
            source2.stringValue(padToEvery: 8, splitEvery: 3, uppercase: false) ==
            "00 000 fff"
        )
        // (prefix treats it as a Swift Integer Literal, inserting underscores for splits)
        #expect(
            source2.stringValue(padToEvery: 2, splitEvery: 2, prefix: true, uppercase: false) ==
            "0x0f_ff"
        )
        
        // edge cases
        #expect(source2.stringValue(padToEvery: 2, splitEvery: -1) == "0FFF")
        
        // octal
        
        let source3 = 0o123456.octal
        
        #expect(source3.stringValue(padToEvery: 0, splitEvery: 0) == "123456")
        #expect(source3.stringValue(padToEvery: 1, splitEvery: 1) == "1 2 3 4 5 6")
        #expect(source3.stringValue(padToEvery: 2, splitEvery: 2) == "12 34 56")
        #expect(source3.stringValue(padToEvery: 4, splitEvery: 3) == "00 123 456")
        
        // prefix treats it as a Swift Integer Literal, inserting underscores for splits
        #expect(
            source3.stringValue(padToEvery: 2, splitEvery: 2, prefix: true) ==
            "0o12_34_56"
        )
        
        // edge cases
        #expect(source3.stringValue(padToEvery: 2, splitEvery: -1) == "123456")
    }
}
