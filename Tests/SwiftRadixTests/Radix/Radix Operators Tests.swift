//
//  Radix Operators Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import Testing

@Suite struct RadixOperatorsTests {
    @Test func radix_Operators() {
        // just test hex (base-16)
        // (since all operators operate on the underlying value, agnostic of radix)
        
        // Equatable
        
        #expect(1.hex == 1.hex)
        #expect(1.hex != 2.hex)
        
        #expect(1.hex == 1)
        #expect(1.hex == UInt8(1))
        #expect(UInt8(1) == 1.hex)
        #expect(1.hex != 2)
        #expect(1.hex != UInt8(2))
        #expect(UInt8(2) != 1.hex)
        
        // Equatable - Optionals
        
        #expect("1".hex == "1".hex)
        #expect("1".hex != "2".hex)
        
        #expect("1".hex == 1)
        #expect("1".hex == UInt8(1))
        #expect(UInt8(1) == 1.hex)
        #expect("1".hex != 2)
        #expect("1".hex != UInt8(2))
        #expect(UInt8(2) != "1".hex)
        
        // Comparable
        
        #expect(2.hex > 1.hex)
        #expect(!(1.hex > 2.hex))
        
        #expect(2.hex > UInt8(1))
        #expect(UInt8(2) > 1.hex)
        #expect(!(1.hex > UInt8(2)))
        #expect(!(UInt8(1) > 2.hex))
        
        #expect(1.hex < 2.hex)
        #expect(!(2.hex < 1.hex))
        
        #expect(1.hex < UInt8(2))
        #expect(UInt8(1) < 2.hex)
        #expect(!(2.hex < Int8(1)))
        #expect(!(UInt8(2) < 1.hex))
        
        #expect(1.hex >= 1.hex)
        #expect(2.hex >= 1.hex)
        
        #expect(1.hex >= UInt8(1))
        #expect(UInt8(2) >= 1.hex)
        
        #expect(1.hex <= 2.hex)
        #expect(2.hex <= 2.hex)
        
        #expect(1.hex <= UInt8(2))
        #expect(UInt8(2) <= 2.hex)
        
        // Math operators
        
        #expect(2.hex + 2.hex == 4.hex)
        #expect(2.hex + 2 == 4.hex)
        #expect(2 + 2.hex == 4)
        #expect(UInt8(2) + UInt8(2).hex == UInt8(4))
        
        #expect(4.hex - 2.hex == 2.hex)
        #expect(4.hex - 2 == 2.hex)
        #expect(4 - 2.hex == 2)
        #expect(UInt8(4) - UInt8(2).hex == UInt8(2))
        
        #expect(4.hex * 2.hex == 8.hex)
        #expect(4.hex * 2 == 8.hex)
        #expect(4 * 2.hex == 8)
        #expect(UInt8(4) * UInt8(2).hex == UInt8(8))
        
        #expect(8.hex / 2.hex == 4.hex)
        #expect(8.hex / 2 == 4.hex)
        #expect(8 / 2.hex == 4)
        #expect(UInt8(8) / UInt8(2).hex == UInt8(4))
        
        // Mutating math operators
        
        var hexVal: Radix<Int>
        var intVal: Int
        
        hexVal = Radix<Int>(0, base: 16)!
        hexVal += 1
        #expect(hexVal == 1)
        hexVal += 1.hex
        #expect(hexVal == 2)
        hexVal -= 1
        #expect(hexVal == 1)
        hexVal -= 1.hex
        #expect(hexVal == 0)
        
        intVal = 0
        intVal += 1.hex
        #expect(intVal == 1)
        intVal -= 1.hex
        #expect(intVal == 0)
        
        hexVal = Radix<Int>(2, base: 16)!
        hexVal *= 2
        #expect(hexVal == 4)
        hexVal *= 2.hex
        #expect(hexVal == 8)
        hexVal /= 2
        #expect(hexVal == 4)
        hexVal /= 2.hex
        #expect(hexVal == 2)
        
        intVal = 2
        intVal *= 2.hex
        #expect(intVal == 4)
        intVal /= 2.hex
        #expect(intVal == 2)
        
        // Bitwise bit shift operators
        
        #expect(0b010.hex >> 1 == 0b001.hex)
        #expect(0b010.hex >> 1.hex == 0b001.hex)
        #expect(0b010 >> 1.hex == 0b001)
        
        #expect(0b010.hex << 1 == 0b100.hex)
        #expect(0b010.hex << 1.hex == 0b100.hex)
        #expect(0b010 << 1.hex == 0b100)
        
        // -- mixed types
        
        #expect(UInt8(0b010).hex >> 1 == UInt8(0b001).hex)
        #expect(0b010.hex >> UInt8(1) == 0b001.hex)
        #expect(UInt8(0b010).hex >> 1.hex == UInt8(0b001).hex)
        #expect(0b010.hex >> UInt8(1).hex == 0b001.hex)
        #expect(UInt8(0b010) >> 1.hex == 0b001)
        #expect(0b010 >> UInt8(1) == 0b001)
        
        #expect(UInt8(0b010).hex << 1 == UInt8(0b100).hex)
        #expect(0b010.hex << UInt8(1) == 0b100.hex)
        #expect(UInt8(0b010).hex << 1.hex == UInt8(0b100).hex)
        #expect(0b010.hex << UInt8(1).hex == 0b100.hex)
        #expect(UInt8(0b010) << 1.hex == UInt8(0b100))
        #expect(0b010 << UInt8(1).hex == 0b100)
        
        // Bitwise AND
        // & operator only supports integers of the same type
        
        #expect(0b11111111.hex & 0b10001000.hex == 0b10001000.hex)
        #expect(0b11111111.hex & 0b10001000 == 0b10001000.hex)
        #expect(0b11111111 & 0b10001000.hex == 0b10001000)
        
        #expect(
            UInt8(0b11111111).hex & UInt8(0b10001000).hex ==
            UInt8(0b10001000).hex
        )
    }
}
