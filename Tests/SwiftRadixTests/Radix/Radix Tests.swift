//
//  Radix Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct RadixTests {
    @Test func radix_Init_Integer() {
        // basic init test, to check if it accepts a variety of integer types and radices
        
        // Int
        
        let radix1 = Radix(0xFF, base: 16)!
        
        #expect(radix1.value.bitWidth == Int.bitWidth)
        #expect(radix1.value == 0xFF)
        #expect(radix1.base == 16)
        
        // UInt8
        
        let radix2 = Radix(UInt8(0xFF), base: 8)!
        
        #expect(radix2.value.bitWidth == UInt8.bitWidth)
        #expect(radix2.value == 0xFF)
        #expect(radix2.base == 8)
    }
    
    @Test func radix_Init_String() {
        // basic init test
        
        // Int
        
        let radix1 = Radix<Int>("0xFF", base: 16)!
        
        #expect(radix1.value.bitWidth == Int.bitWidth)
        #expect(radix1.value == 0xFF)
        #expect(radix1.base == 16)
        
        // UInt8
        
        let radix2 = Radix<UInt8>("0xFF", base: 16)
        
        #expect(radix2?.value.bitWidth == UInt8.bitWidth)
        #expect(radix2?.value == 0xFF)
        #expect(radix2?.base == 16)
        
        // edge cases
        
        // empty string
        
        let radix3 = Radix<Int>("", base: 16)
        
        #expect(radix3 == nil)
    }
    
    @Test func radix_Init_Integer_InvalidRadix() {
        // invalid radix (outside 2...36)
        
        #expect(Radix(123, base: -1) == nil)
        #expect(Radix(123, base: 0) == nil)
        #expect(Radix(123, base: 1) == nil)
        #expect(Radix(123, base: 37) == nil)
    }
    
    @Test func radix_Init_String_InvalidRadix() {
        // invalid radix (outside 2...36)
        
        #expect(Radix<Int>("1", base: -1) == nil)
        #expect(Radix<Int>("1", base: 0) == nil)
        #expect(Radix<Int>("1", base: 1) == nil)
        #expect(Radix<Int>("1", base: 37) == nil)
    }
    
    @Test func radix_Init_Integer_NonStandardRadix() {
        // base-2 is binary; skip testing it here
        
        let radix3 = Radix(123, base: 3)!
        
        #expect(radix3.value == 123)
        #expect(radix3.base == 3)
        #expect(radix3.stringValue == "11120")
        
        let radix4 = Radix(123, base: 4)!
        
        #expect(radix4.value == 123)
        #expect(radix4.base == 4)
        #expect(radix4.stringValue == "1323")
        
        let radix5 = Radix(123, base: 5)!
        
        #expect(radix5.value == 123)
        #expect(radix5.base == 5)
        #expect(radix5.stringValue == "443")
        
        let radix6 = Radix(123, base: 6)!
        
        #expect(radix6.value == 123)
        #expect(radix6.base == 6)
        #expect(radix6.stringValue == "323")
        
        let radix7 = Radix(123, base: 7)!
        
        #expect(radix7.value == 123)
        #expect(radix7.base == 7)
        #expect(radix7.stringValue == "234")
        
        // base-8 is octal; skip testing it here
        
        let radix9 = Radix(123, base: 9)!
        
        #expect(radix9.value == 123)
        #expect(radix9.base == 9)
        #expect(radix9.stringValue == "146")
        
        let radix10 = Radix(123, base: 10)!
        
        #expect(radix10.value == 123)
        #expect(radix10.base == 10)
        #expect(radix10.stringValue == "123")
        
        let radix11 = Radix(123, base: 11)!
        
        #expect(radix11.value == 123)
        #expect(radix11.base == 11)
        #expect(radix11.stringValue == "102")
        
        let radix12 = Radix(123, base: 12)!
        
        #expect(radix12.value == 123)
        #expect(radix12.base == 12)
        #expect(radix12.stringValue == "A3")
        
        let radix13 = Radix(123, base: 13)!
        
        #expect(radix13.value == 123)
        #expect(radix13.base == 13)
        #expect(radix13.stringValue == "96")
        
        let radix14 = Radix(123, base: 14)!
        
        #expect(radix14.value == 123)
        #expect(radix14.base == 14)
        #expect(radix14.stringValue == "8B")
        
        let radix15 = Radix(123, base: 15)!
        
        #expect(radix15.value == 123)
        #expect(radix15.base == 15)
        #expect(radix15.stringValue == "83")
        
        // base-16 is hex; skip testing it here
        
        let radix17 = Radix(123, base: 17)!
        
        #expect(radix17.value == 123)
        #expect(radix17.base == 17)
        #expect(radix17.stringValue == "74")
        
        let radix18 = Radix(123, base: 18)!
        
        #expect(radix18.value == 123)
        #expect(radix18.base == 18)
        #expect(radix18.stringValue == "6F")
        
        let radix19 = Radix(123, base: 19)!
        
        #expect(radix19.value == 123)
        #expect(radix19.base == 19)
        #expect(radix19.stringValue == "69")
        
        let radix20 = Radix(123, base: 20)!
        
        #expect(radix20.value == 123)
        #expect(radix20.base == 20)
        #expect(radix20.stringValue == "63")
        
        let radix21 = Radix(123, base: 21)!
        
        #expect(radix21.value == 123)
        #expect(radix21.base == 21)
        #expect(radix21.stringValue == "5I")
        
        let radix22 = Radix(123, base: 22)!
        
        #expect(radix22.value == 123)
        #expect(radix22.base == 22)
        #expect(radix22.stringValue == "5D")
        
        let radix23 = Radix(123, base: 23)!
        
        #expect(radix23.value == 123)
        #expect(radix23.base == 23)
        #expect(radix23.stringValue == "58")
        
        let radix24 = Radix(123, base: 24)!
        
        #expect(radix24.value == 123)
        #expect(radix24.base == 24)
        #expect(radix24.stringValue == "53")
        
        let radix25 = Radix(123, base: 25)!
        
        #expect(radix25.value == 123)
        #expect(radix25.base == 25)
        #expect(radix25.stringValue == "4N")
        
        let radix26 = Radix(123, base: 26)!
        
        #expect(radix26.value == 123)
        #expect(radix26.base == 26)
        #expect(radix26.stringValue == "4J")
        
        let radix27 = Radix(123, base: 27)!
        
        #expect(radix27.value == 123)
        #expect(radix27.base == 27)
        #expect(radix27.stringValue == "4F")
        
        let radix28 = Radix(123, base: 28)!
        
        #expect(radix28.value == 123)
        #expect(radix28.base == 28)
        #expect(radix28.stringValue == "4B")
        
        let radix29 = Radix(123, base: 29)!
        
        #expect(radix29.value == 123)
        #expect(radix29.base == 29)
        #expect(radix29.stringValue == "47")
        
        let radix30 = Radix(123, base: 30)!
        
        #expect(radix30.value == 123)
        #expect(radix30.base == 30)
        #expect(radix30.stringValue == "43")
        
        let radix31 = Radix(123, base: 31)!
        
        #expect(radix31.value == 123)
        #expect(radix31.base == 31)
        #expect(radix31.stringValue == "3U")
        
        let radix32 = Radix(123, base: 32)!
        
        #expect(radix32.value == 123)
        #expect(radix32.base == 32)
        #expect(radix32.stringValue == "3R")
        
        let radix33 = Radix(123, base: 33)!
        
        #expect(radix33.value == 123)
        #expect(radix33.base == 33)
        #expect(radix33.stringValue == "3O")
        
        let radix34 = Radix(123, base: 34)!
        
        #expect(radix34.value == 123)
        #expect(radix34.base == 34)
        #expect(radix34.stringValue == "3L")
        
        let radix35 = Radix(123, base: 35)!
        
        #expect(radix35.value == 123)
        #expect(radix35.base == 35)
        #expect(radix35.stringValue == "3I")
        
        let radix36 = Radix(123, base: 36)!
        
        #expect(radix36.value == 123)
        #expect(radix36.base == 36)
        #expect(radix36.stringValue == "3F")
    }
    
    @Test func radix_Init_String_NonStandardRadix() {
        // base-2 is binary; skip testing it here
        
        let radix3 = Radix<Int>("11120", base: 3)
        
        #expect(radix3 != nil)
        #expect(radix3?.value == 123)
        #expect(radix3?.base == 3)
        
        let radix4 = Radix<Int>("1323", base: 4)
        
        #expect(radix4 != nil)
        #expect(radix4?.value == 123)
        #expect(radix4?.base == 4)
        
        let radix5 = Radix<Int>("443", base: 5)
        
        #expect(radix5 != nil)
        #expect(radix5?.value == 123)
        #expect(radix5?.base == 5)
        
        let radix6 = Radix<Int>("323", base: 6)
        
        #expect(radix6 != nil)
        #expect(radix6?.value == 123)
        #expect(radix6?.base == 6)
        
        let radix7 = Radix<Int>("234", base: 7)
        
        #expect(radix7 != nil)
        #expect(radix7?.value == 123)
        #expect(radix7?.base == 7)
        
        // base-8 is octal; skip testing it here
        
        let radix9 = Radix<Int>("146", base: 9)
        
        #expect(radix9 != nil)
        #expect(radix9?.value == 123)
        #expect(radix9?.base == 9)
        
        let radix10 = Radix<Int>("123", base: 10)
        
        #expect(radix10 != nil)
        #expect(radix10?.value == 123)
        #expect(radix10?.base == 10)
        
        let radix11 = Radix<Int>("102", base: 11)
        
        #expect(radix11 != nil)
        #expect(radix11?.value == 123)
        #expect(radix11?.base == 11)
        
        let radix12 = Radix<Int>("A3", base: 12)
        
        #expect(radix12 != nil)
        #expect(radix12?.value == 123)
        #expect(radix12?.base == 12)
        
        let radix13 = Radix<Int>("96", base: 13)
        
        #expect(radix13 != nil)
        #expect(radix13?.value == 123)
        #expect(radix13?.base == 13)
        
        let radix14 = Radix<Int>("8B", base: 14)
        
        #expect(radix14 != nil)
        #expect(radix14?.value == 123)
        #expect(radix14?.base == 14)
        
        let radix15 = Radix<Int>("83", base: 15)
        
        // base-16 is hex; skip testing it here
        
        #expect(radix15 != nil)
        #expect(radix15?.value == 123)
        #expect(radix15?.base == 15)
        
        let radix17 = Radix<Int>("74", base: 17)
        
        #expect(radix17 != nil)
        #expect(radix17?.value == 123)
        #expect(radix17?.base == 17)
        
        let radix18 = Radix<Int>("6F", base: 18)
        
        #expect(radix18 != nil)
        #expect(radix18?.value == 123)
        #expect(radix18?.base == 18)
        
        let radix19 = Radix<Int>("69", base: 19)
        
        #expect(radix19 != nil)
        #expect(radix19?.value == 123)
        #expect(radix19?.base == 19)
        
        let radix20 = Radix<Int>("63", base: 20)
        
        #expect(radix20 != nil)
        #expect(radix20?.value == 123)
        #expect(radix20?.base == 20)
        
        let radix21 = Radix<Int>("5I", base: 21)
        
        #expect(radix21 != nil)
        #expect(radix21?.value == 123)
        #expect(radix21?.base == 21)
        
        let radix22 = Radix<Int>("5D", base: 22)
        
        #expect(radix22 != nil)
        #expect(radix22?.value == 123)
        #expect(radix22?.base == 22)
        
        let radix23 = Radix<Int>("58", base: 23)
        
        #expect(radix23 != nil)
        #expect(radix23?.value == 123)
        #expect(radix23?.base == 23)
        
        let radix24 = Radix<Int>("53", base: 24)
        
        #expect(radix24 != nil)
        #expect(radix24?.value == 123)
        #expect(radix24?.base == 24)
        
        let radix25 = Radix<Int>("4N", base: 25)
        
        #expect(radix25 != nil)
        #expect(radix25?.value == 123)
        #expect(radix25?.base == 25)
        
        let radix26 = Radix<Int>("4J", base: 26)
        
        #expect(radix26 != nil)
        #expect(radix26?.value == 123)
        #expect(radix26?.base == 26)
        
        let radix27 = Radix<Int>("4F", base: 27)
        
        #expect(radix27 != nil)
        #expect(radix27?.value == 123)
        #expect(radix27?.base == 27)
        
        let radix28 = Radix<Int>("4B", base: 28)
        
        #expect(radix28 != nil)
        #expect(radix28?.value == 123)
        #expect(radix28?.base == 28)
        
        let radix29 = Radix<Int>("47", base: 29)
        
        #expect(radix29 != nil)
        #expect(radix29?.value == 123)
        #expect(radix29?.base == 29)
        
        let radix30 = Radix<Int>("43", base: 30)
        
        #expect(radix30 != nil)
        #expect(radix30?.value == 123)
        #expect(radix30?.base == 30)
        
        let radix31 = Radix<Int>("3U", base: 31)
        
        #expect(radix31 != nil)
        #expect(radix31?.value == 123)
        #expect(radix31?.base == 31)
        
        let radix32 = Radix<Int>("3R", base: 32)
        
        #expect(radix32 != nil)
        #expect(radix32?.value == 123)
        #expect(radix32?.base == 32)
        
        let radix33 = Radix<Int>("3O", base: 33)
        
        #expect(radix33 != nil)
        #expect(radix33?.value == 123)
        #expect(radix33?.base == 33)
        
        let radix34 = Radix<Int>("3L", base: 34)
        
        #expect(radix34 != nil)
        #expect(radix34?.value == 123)
        #expect(radix34?.base == 34)
        
        let radix35 = Radix<Int>("3I", base: 35)
        
        #expect(radix35 != nil)
        #expect(radix35?.value == 123)
        #expect(radix35?.base == 35)
        
        let radix36 = Radix<Int>("3F", base: 36)
        
        #expect(radix36 != nil)
        #expect(radix36?.value == 123)
        #expect(radix36?.base == 36)
    }
}
