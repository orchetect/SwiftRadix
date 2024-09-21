//
//  Radix Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022 Steffan Andrews • Licensed under MIT License
//

import XCTest
import SwiftRadix

final class RadixTests: XCTestCase {
    func testRadix_Init_Integer() {
        // basic init test, to check if it accepts a variety of integer types and radices
        
        // Int
        
        let radix1 = Radix(0xFF, base: 16)!
        
        XCTAssertEqual(radix1.value.bitWidth, Int.bitWidth)
        XCTAssertEqual(radix1.value, 0xFF)
        XCTAssertEqual(radix1.base, 16)
        
        // UInt8
        
        let radix2 = Radix(UInt8(0xFF), base: 8)!
        
        XCTAssertEqual(radix2.value.bitWidth, UInt8.bitWidth)
        XCTAssertEqual(radix2.value, 0xFF)
        XCTAssertEqual(radix2.base, 8)
    }
    
    func testRadix_Init_String() {
        // basic init test
        
        // Int
        
        let radix1 = Radix<Int>("0xFF", base: 16)!
        
        XCTAssertEqual(radix1.value.bitWidth, Int.bitWidth)
        XCTAssertEqual(radix1.value, 0xFF)
        XCTAssertEqual(radix1.base, 16)
        
        // UInt8
        
        let radix2 = Radix<UInt8>("0xFF", base: 16)
        
        XCTAssertEqual(radix2?.value.bitWidth, UInt8.bitWidth)
        XCTAssertEqual(radix2?.value, 0xFF)
        XCTAssertEqual(radix2?.base, 16)
        
        // edge cases
        
        // empty string
        
        let radix3 = Radix<Int>("", base: 16)
        
        XCTAssertNil(radix3)
    }
    
    func testRadix_Init_Integer_InvalidRadix() {
        // invalid radix (outside 2...36)
        
        XCTAssertNil(Radix(123, base: -1))
        XCTAssertNil(Radix(123, base: 0))
        XCTAssertNil(Radix(123, base: 1))
        XCTAssertNil(Radix(123, base: 37))
    }
    
    func testRadix_Init_String_InvalidRadix() {
        // invalid radix (outside 2...36)
        
        XCTAssertNil(Radix<Int>("1", base: -1))
        XCTAssertNil(Radix<Int>("1", base: 0))
        XCTAssertNil(Radix<Int>("1", base: 1))
        XCTAssertNil(Radix<Int>("1", base: 37))
    }
    
    func testRadix_Init_Integer_NonStandardRadix() {
        // base-2 is binary; skip testing it here
        
        let radix3 = Radix(123, base: 3)!
        
        XCTAssertEqual(radix3.value, 123)
        XCTAssertEqual(radix3.base, 3)
        XCTAssertEqual(radix3.stringValue, "11120")
        
        let radix4 = Radix(123, base: 4)!
        
        XCTAssertEqual(radix4.value, 123)
        XCTAssertEqual(radix4.base, 4)
        XCTAssertEqual(radix4.stringValue, "1323")
        
        let radix5 = Radix(123, base: 5)!
        
        XCTAssertEqual(radix5.value, 123)
        XCTAssertEqual(radix5.base, 5)
        XCTAssertEqual(radix5.stringValue, "443")
        
        let radix6 = Radix(123, base: 6)!
        
        XCTAssertEqual(radix6.value, 123)
        XCTAssertEqual(radix6.base, 6)
        XCTAssertEqual(radix6.stringValue, "323")
        
        let radix7 = Radix(123, base: 7)!
        
        XCTAssertEqual(radix7.value, 123)
        XCTAssertEqual(radix7.base, 7)
        XCTAssertEqual(radix7.stringValue, "234")
        
        // base-8 is octal; skip testing it here
        
        let radix9 = Radix(123, base: 9)!
        
        XCTAssertEqual(radix9.value, 123)
        XCTAssertEqual(radix9.base, 9)
        XCTAssertEqual(radix9.stringValue, "146")
        
        let radix10 = Radix(123, base: 10)!
        
        XCTAssertEqual(radix10.value, 123)
        XCTAssertEqual(radix10.base, 10)
        XCTAssertEqual(radix10.stringValue, "123")
        
        let radix11 = Radix(123, base: 11)!
        
        XCTAssertEqual(radix11.value, 123)
        XCTAssertEqual(radix11.base, 11)
        XCTAssertEqual(radix11.stringValue, "102")
        
        let radix12 = Radix(123, base: 12)!
        
        XCTAssertEqual(radix12.value, 123)
        XCTAssertEqual(radix12.base, 12)
        XCTAssertEqual(radix12.stringValue, "A3")
        
        let radix13 = Radix(123, base: 13)!
        
        XCTAssertEqual(radix13.value, 123)
        XCTAssertEqual(radix13.base, 13)
        XCTAssertEqual(radix13.stringValue, "96")
        
        let radix14 = Radix(123, base: 14)!
        
        XCTAssertEqual(radix14.value, 123)
        XCTAssertEqual(radix14.base, 14)
        XCTAssertEqual(radix14.stringValue, "8B")
        
        let radix15 = Radix(123, base: 15)!
        
        XCTAssertEqual(radix15.value, 123)
        XCTAssertEqual(radix15.base, 15)
        XCTAssertEqual(radix15.stringValue, "83")
        
        // base-16 is hex; skip testing it here
        
        let radix17 = Radix(123, base: 17)!
        
        XCTAssertEqual(radix17.value, 123)
        XCTAssertEqual(radix17.base, 17)
        XCTAssertEqual(radix17.stringValue, "74")
        
        let radix18 = Radix(123, base: 18)!
        
        XCTAssertEqual(radix18.value, 123)
        XCTAssertEqual(radix18.base, 18)
        XCTAssertEqual(radix18.stringValue, "6F")
        
        let radix19 = Radix(123, base: 19)!
        
        XCTAssertEqual(radix19.value, 123)
        XCTAssertEqual(radix19.base, 19)
        XCTAssertEqual(radix19.stringValue, "69")
        
        let radix20 = Radix(123, base: 20)!
        
        XCTAssertEqual(radix20.value, 123)
        XCTAssertEqual(radix20.base, 20)
        XCTAssertEqual(radix20.stringValue, "63")
        
        let radix21 = Radix(123, base: 21)!
        
        XCTAssertEqual(radix21.value, 123)
        XCTAssertEqual(radix21.base, 21)
        XCTAssertEqual(radix21.stringValue, "5I")
        
        let radix22 = Radix(123, base: 22)!
        
        XCTAssertEqual(radix22.value, 123)
        XCTAssertEqual(radix22.base, 22)
        XCTAssertEqual(radix22.stringValue, "5D")
        
        let radix23 = Radix(123, base: 23)!
        
        XCTAssertEqual(radix23.value, 123)
        XCTAssertEqual(radix23.base, 23)
        XCTAssertEqual(radix23.stringValue, "58")
        
        let radix24 = Radix(123, base: 24)!
        
        XCTAssertEqual(radix24.value, 123)
        XCTAssertEqual(radix24.base, 24)
        XCTAssertEqual(radix24.stringValue, "53")
        
        let radix25 = Radix(123, base: 25)!
        
        XCTAssertEqual(radix25.value, 123)
        XCTAssertEqual(radix25.base, 25)
        XCTAssertEqual(radix25.stringValue, "4N")
        
        let radix26 = Radix(123, base: 26)!
        
        XCTAssertEqual(radix26.value, 123)
        XCTAssertEqual(radix26.base, 26)
        XCTAssertEqual(radix26.stringValue, "4J")
        
        let radix27 = Radix(123, base: 27)!
        
        XCTAssertEqual(radix27.value, 123)
        XCTAssertEqual(radix27.base, 27)
        XCTAssertEqual(radix27.stringValue, "4F")
        
        let radix28 = Radix(123, base: 28)!
        
        XCTAssertEqual(radix28.value, 123)
        XCTAssertEqual(radix28.base, 28)
        XCTAssertEqual(radix28.stringValue, "4B")
        
        let radix29 = Radix(123, base: 29)!
        
        XCTAssertEqual(radix29.value, 123)
        XCTAssertEqual(radix29.base, 29)
        XCTAssertEqual(radix29.stringValue, "47")
        
        let radix30 = Radix(123, base: 30)!
        
        XCTAssertEqual(radix30.value, 123)
        XCTAssertEqual(radix30.base, 30)
        XCTAssertEqual(radix30.stringValue, "43")
        
        let radix31 = Radix(123, base: 31)!
        
        XCTAssertEqual(radix31.value, 123)
        XCTAssertEqual(radix31.base, 31)
        XCTAssertEqual(radix31.stringValue, "3U")
        
        let radix32 = Radix(123, base: 32)!
        
        XCTAssertEqual(radix32.value, 123)
        XCTAssertEqual(radix32.base, 32)
        XCTAssertEqual(radix32.stringValue, "3R")
        
        let radix33 = Radix(123, base: 33)!
        
        XCTAssertEqual(radix33.value, 123)
        XCTAssertEqual(radix33.base, 33)
        XCTAssertEqual(radix33.stringValue, "3O")
        
        let radix34 = Radix(123, base: 34)!
        
        XCTAssertEqual(radix34.value, 123)
        XCTAssertEqual(radix34.base, 34)
        XCTAssertEqual(radix34.stringValue, "3L")
        
        let radix35 = Radix(123, base: 35)!
        
        XCTAssertEqual(radix35.value, 123)
        XCTAssertEqual(radix35.base, 35)
        XCTAssertEqual(radix35.stringValue, "3I")
        
        let radix36 = Radix(123, base: 36)!
        
        XCTAssertEqual(radix36.value, 123)
        XCTAssertEqual(radix36.base, 36)
        XCTAssertEqual(radix36.stringValue, "3F")
    }
    
    func testRadix_Init_String_NonStandardRadix() {
        // base-2 is binary; skip testing it here
        
        let radix3 = Radix<Int>("11120", base: 3)
        
        XCTAssertNotNil(radix3)
        XCTAssertEqual(radix3?.value, 123)
        XCTAssertEqual(radix3?.base, 3)
        
        let radix4 = Radix<Int>("1323", base: 4)
        
        XCTAssertNotNil(radix4)
        XCTAssertEqual(radix4?.value, 123)
        XCTAssertEqual(radix4?.base, 4)
        
        let radix5 = Radix<Int>("443", base: 5)
        
        XCTAssertNotNil(radix5)
        XCTAssertEqual(radix5?.value, 123)
        XCTAssertEqual(radix5?.base, 5)
        
        let radix6 = Radix<Int>("323", base: 6)
        
        XCTAssertNotNil(radix6)
        XCTAssertEqual(radix6?.value, 123)
        XCTAssertEqual(radix6?.base, 6)
        
        let radix7 = Radix<Int>("234", base: 7)
        
        XCTAssertNotNil(radix7)
        XCTAssertEqual(radix7?.value, 123)
        XCTAssertEqual(radix7?.base, 7)
        
        // base-8 is octal; skip testing it here
        
        let radix9 = Radix<Int>("146", base: 9)
        
        XCTAssertNotNil(radix9)
        XCTAssertEqual(radix9?.value, 123)
        XCTAssertEqual(radix9?.base, 9)
        
        let radix10 = Radix<Int>("123", base: 10)
        
        XCTAssertNotNil(radix10)
        XCTAssertEqual(radix10?.value, 123)
        XCTAssertEqual(radix10?.base, 10)
        
        let radix11 = Radix<Int>("102", base: 11)
        
        XCTAssertNotNil(radix11)
        XCTAssertEqual(radix11?.value, 123)
        XCTAssertEqual(radix11?.base, 11)
        
        let radix12 = Radix<Int>("A3", base: 12)
        
        XCTAssertNotNil(radix12)
        XCTAssertEqual(radix12?.value, 123)
        XCTAssertEqual(radix12?.base, 12)
        
        let radix13 = Radix<Int>("96", base: 13)
        
        XCTAssertNotNil(radix13)
        XCTAssertEqual(radix13?.value, 123)
        XCTAssertEqual(radix13?.base, 13)
        
        let radix14 = Radix<Int>("8B", base: 14)
        
        XCTAssertNotNil(radix14)
        XCTAssertEqual(radix14?.value, 123)
        XCTAssertEqual(radix14?.base, 14)
        
        let radix15 = Radix<Int>("83", base: 15)
        
        // base-16 is hex; skip testing it here
        
        XCTAssertNotNil(radix15)
        XCTAssertEqual(radix15?.value, 123)
        XCTAssertEqual(radix15?.base, 15)
        
        let radix17 = Radix<Int>("74", base: 17)
        
        XCTAssertNotNil(radix17)
        XCTAssertEqual(radix17?.value, 123)
        XCTAssertEqual(radix17?.base, 17)
        
        let radix18 = Radix<Int>("6F", base: 18)
        
        XCTAssertNotNil(radix18)
        XCTAssertEqual(radix18?.value, 123)
        XCTAssertEqual(radix18?.base, 18)
        
        let radix19 = Radix<Int>("69", base: 19)
        
        XCTAssertNotNil(radix19)
        XCTAssertEqual(radix19?.value, 123)
        XCTAssertEqual(radix19?.base, 19)
        
        let radix20 = Radix<Int>("63", base: 20)
        
        XCTAssertNotNil(radix20)
        XCTAssertEqual(radix20?.value, 123)
        XCTAssertEqual(radix20?.base, 20)
        
        let radix21 = Radix<Int>("5I", base: 21)
        
        XCTAssertNotNil(radix21)
        XCTAssertEqual(radix21?.value, 123)
        XCTAssertEqual(radix21?.base, 21)
        
        let radix22 = Radix<Int>("5D", base: 22)
        
        XCTAssertNotNil(radix22)
        XCTAssertEqual(radix22?.value, 123)
        XCTAssertEqual(radix22?.base, 22)
        
        let radix23 = Radix<Int>("58", base: 23)
        
        XCTAssertNotNil(radix23)
        XCTAssertEqual(radix23?.value, 123)
        XCTAssertEqual(radix23?.base, 23)
        
        let radix24 = Radix<Int>("53", base: 24)
        
        XCTAssertNotNil(radix24)
        XCTAssertEqual(radix24?.value, 123)
        XCTAssertEqual(radix24?.base, 24)
        
        let radix25 = Radix<Int>("4N", base: 25)
        
        XCTAssertNotNil(radix25)
        XCTAssertEqual(radix25?.value, 123)
        XCTAssertEqual(radix25?.base, 25)
        
        let radix26 = Radix<Int>("4J", base: 26)
        
        XCTAssertNotNil(radix26)
        XCTAssertEqual(radix26?.value, 123)
        XCTAssertEqual(radix26?.base, 26)
        
        let radix27 = Radix<Int>("4F", base: 27)
        
        XCTAssertNotNil(radix27)
        XCTAssertEqual(radix27?.value, 123)
        XCTAssertEqual(radix27?.base, 27)
        
        let radix28 = Radix<Int>("4B", base: 28)
        
        XCTAssertNotNil(radix28)
        XCTAssertEqual(radix28?.value, 123)
        XCTAssertEqual(radix28?.base, 28)
        
        let radix29 = Radix<Int>("47", base: 29)
        
        XCTAssertNotNil(radix29)
        XCTAssertEqual(radix29?.value, 123)
        XCTAssertEqual(radix29?.base, 29)
        
        let radix30 = Radix<Int>("43", base: 30)
        
        XCTAssertNotNil(radix30)
        XCTAssertEqual(radix30?.value, 123)
        XCTAssertEqual(radix30?.base, 30)
        
        let radix31 = Radix<Int>("3U", base: 31)
        
        XCTAssertNotNil(radix31)
        XCTAssertEqual(radix31?.value, 123)
        XCTAssertEqual(radix31?.base, 31)
        
        let radix32 = Radix<Int>("3R", base: 32)
        
        XCTAssertNotNil(radix32)
        XCTAssertEqual(radix32?.value, 123)
        XCTAssertEqual(radix32?.base, 32)
        
        let radix33 = Radix<Int>("3O", base: 33)
        
        XCTAssertNotNil(radix33)
        XCTAssertEqual(radix33?.value, 123)
        XCTAssertEqual(radix33?.base, 33)
        
        let radix34 = Radix<Int>("3L", base: 34)
        
        XCTAssertNotNil(radix34)
        XCTAssertEqual(radix34?.value, 123)
        XCTAssertEqual(radix34?.base, 34)
        
        let radix35 = Radix<Int>("3I", base: 35)
        
        XCTAssertNotNil(radix35)
        XCTAssertEqual(radix35?.value, 123)
        XCTAssertEqual(radix35?.base, 35)
        
        let radix36 = Radix<Int>("3F", base: 36)
        
        XCTAssertNotNil(radix36)
        XCTAssertEqual(radix36?.value, 123)
        XCTAssertEqual(radix36?.base, 36)
    }
}
