//
//  Radix Operators Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import XCTest

final class RadixOperatorsTests: XCTestCase {
    func testRadix_Operators() {
        // just test hex (base-16)
        // (since all operators operate on the underlying value, agnostic of radix)
        
        // Equatable
        
        XCTAssert(1.hex    == 1.hex)
        XCTAssert(1.hex    != 2.hex)
        
        XCTAssert(1.hex    == 1)
        XCTAssert(1.hex    == UInt8(1))
        XCTAssert(UInt8(1) == 1.hex)
        XCTAssert(1.hex    != 2)
        XCTAssert(1.hex    != UInt8(2))
        XCTAssert(UInt8(2) != 1.hex)
        
        // Equatable - Optionals
        
        XCTAssert("1".hex  == "1".hex)
        XCTAssert("1".hex  != "2".hex)
        
        XCTAssert("1".hex  == 1)
        XCTAssert("1".hex  == UInt8(1))
        XCTAssert(UInt8(1) == 1.hex)
        XCTAssert("1".hex  != 2)
        XCTAssert("1".hex  != UInt8(2))
        XCTAssert(UInt8(2) != "1".hex)
        
        // Comparable
        
        XCTAssert(2.hex    >  1.hex)
        XCTAssertFalse(1.hex    >  2.hex)
        
        XCTAssert(2.hex    >  UInt8(1))
        XCTAssert(UInt8(2) >  1.hex)
        XCTAssertFalse(1.hex    >  UInt8(2))
        XCTAssertFalse(UInt8(1) >  2.hex)
        
        XCTAssert(1.hex    <  2.hex)
        XCTAssertFalse(2.hex    <  1.hex)
        
        XCTAssert(1.hex    <  UInt8(2))
        XCTAssert(UInt8(1) <  2.hex)
        XCTAssertFalse(2.hex    <  Int8(1))
        XCTAssertFalse(UInt8(2) <  1.hex)
        
        XCTAssert(1.hex    >= 1.hex)
        XCTAssert(2.hex    >= 1.hex)
        
        XCTAssert(1.hex    >= UInt8(1))
        XCTAssert(UInt8(2) >= 1.hex)
        
        XCTAssert(1.hex    <= 2.hex)
        XCTAssert(2.hex    <= 2.hex)
        
        XCTAssert(1.hex    <= UInt8(2))
        XCTAssert(UInt8(2) <= 2.hex)
        
        // Math operators
        
        XCTAssertEqual(2.hex    + 2.hex, 4.hex)
        XCTAssertEqual(2.hex    + 2, 4.hex)
        XCTAssertEqual(2        + 2.hex, 4)
        XCTAssertEqual(UInt8(2) + UInt8(2).hex, UInt8(4))
        
        XCTAssertEqual(4.hex    - 2.hex, 2.hex)
        XCTAssertEqual(4.hex    - 2, 2.hex)
        XCTAssertEqual(4        - 2.hex, 2)
        XCTAssertEqual(UInt8(4) - UInt8(2).hex, UInt8(2))
        
        XCTAssertEqual(4.hex    * 2.hex, 8.hex)
        XCTAssertEqual(4.hex    * 2, 8.hex)
        XCTAssertEqual(4        * 2.hex, 8)
        XCTAssertEqual(UInt8(4) * UInt8(2).hex, UInt8(8))
        
        XCTAssertEqual(8.hex    / 2.hex, 4.hex)
        XCTAssertEqual(8.hex    / 2, 4.hex)
        XCTAssertEqual(8        / 2.hex, 4)
        XCTAssertEqual(UInt8(8) / UInt8(2).hex, UInt8(4))
        
        // Mutating math operators
        
        var hexVal: Radix<Int>
        var intVal: Int
        
        hexVal = Radix<Int>(0, base: 16)!
        hexVal += 1
        XCTAssert(hexVal == 1)
        hexVal += 1.hex
        XCTAssert(hexVal == 2)
        hexVal -= 1
        XCTAssert(hexVal == 1)
        hexVal -= 1.hex
        XCTAssert(hexVal == 0)
        
        intVal = 0
        intVal += 1.hex
        XCTAssert(intVal == 1)
        intVal -= 1.hex
        XCTAssert(intVal == 0)
        
        hexVal = Radix<Int>(2, base: 16)!
        hexVal *= 2
        XCTAssert(hexVal == 4)
        hexVal *= 2.hex
        XCTAssert(hexVal == 8)
        hexVal /= 2
        XCTAssert(hexVal == 4)
        hexVal /= 2.hex
        XCTAssert(hexVal == 2)
        
        intVal = 2
        intVal *= 2.hex
        XCTAssert(intVal == 4)
        intVal /= 2.hex
        XCTAssert(intVal == 2)
        
        // Bitwise bit shift operators
        
        XCTAssertEqual(0b010.hex >> 1, 0b001.hex)
        XCTAssertEqual(0b010.hex >> 1.hex, 0b001.hex)
        XCTAssertEqual(0b010     >> 1.hex, 0b001)
        
        XCTAssertEqual(0b010.hex << 1, 0b100.hex)
        XCTAssertEqual(0b010.hex << 1.hex, 0b100.hex)
        XCTAssertEqual(0b010     << 1.hex, 0b100)
        
        // -- mixed types
        
        XCTAssertEqual(UInt8(0b010).hex >> 1, UInt8(0b001).hex)
        XCTAssertEqual(0b010.hex >> UInt8(1),       0b001.hex)
        XCTAssertEqual(UInt8(0b010).hex >>       1.hex, UInt8(0b001).hex)
        XCTAssertEqual(0b010.hex >> UInt8(1).hex,       0b001.hex)
        XCTAssertEqual(UInt8(0b010)     >>       1.hex,       0b001)
        XCTAssertEqual(0b010      >> UInt8(1),       0b001)
        
        XCTAssertEqual(UInt8(0b010).hex <<       1, UInt8(0b100).hex)
        XCTAssertEqual(0b010.hex << UInt8(1),       0b100.hex)
        XCTAssertEqual(UInt8(0b010).hex <<       1.hex, UInt8(0b100).hex)
        XCTAssertEqual(0b010.hex << UInt8(1).hex,       0b100.hex)
        XCTAssertEqual(UInt8(0b010)     <<       1.hex, UInt8(0b100))
        XCTAssertEqual(0b010      << UInt8(1).hex,       0b100)
        
        // Bitwise AND
        // & operator only supports integers of the same type
        
        XCTAssertEqual(0b11111111.hex & 0b10001000.hex, 0b10001000.hex)
        XCTAssertEqual(0b11111111.hex & 0b10001000, 0b10001000.hex)
        XCTAssertEqual(0b11111111     & 0b10001000.hex, 0b10001000)
        
        XCTAssertEqual(
            UInt8(0b11111111).hex & UInt8(0b10001000).hex,
            UInt8(0b10001000).hex
        )
    }
}
