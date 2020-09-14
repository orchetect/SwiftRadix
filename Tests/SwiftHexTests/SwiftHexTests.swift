import XCTest
@testable import SwiftHex

final class SwiftHexTests: XCTestCase {
    
    // MARK: - Convert to or from hex strings
    
    /// 255.hex.stringValue                   // "FF"
    func testIntToHexString() {
        XCTAssertEqual(255.hex.stringValue, "FF")
    }
    
    /// 255.hex.stringValue(withPrefix: true) // "0xFF"
    func testIntToHexStringWithPrefix() {
        XCTAssertEqual(255.hex.stringValue(withPrefix: true), "0xFF")
    }
    
    /// "FF".hex?.value                       // Optional(255)
    func testHexStringToInt() {
        XCTAssertEqual("FF".hex?.value, 255)
    }
    
    /// "0xFF".hex?.value                     // Optional(255)
    func testHexStringWithPrefixToInt() {
        XCTAssertEqual("0xFF".hex?.value, 255)
    }
    
    /// "ZZ".hex?.value                       // nil (not valid hex string, so init fails)
    func testInvalidHexStringToInt() {
        XCTAssertEqual("ZZ".hex?.value, nil)
    }

    // MARK: - Work with arrays of any integer type, or hex strings and convert between them

    /// [0, 255, 0, 255].hex.stringValue                      // "00 FF 00 FF"
    func testIntArrayToHexStringValue() {
        XCTAssertEqual([0, 255, 0, 255].hex.stringValue, "00 FF 00 FF")
    }
    
    /// [0, 255, 0, 255].hex.stringValues                     // ["00", "FF", "00", "FF"]
    func testIntArrayToHexStringValues() {
        XCTAssertEqual([0, 255, 0, 255].hex.stringValues, ["00", "FF", "00", "FF"])
    }
    
    /// [0, 255, 0, 255].hex.stringValue(withPrefix: true)    // "0x00 0xFF 0x00 0xFF"
    func testIntArrayToHexStringValueWithPrefix() {
        XCTAssertEqual([0, 255, 0, 255].hex.stringValue(withPrefix: true), "0x00 0xFF 0x00 0xFF")
    }
    
    /// [0, 255, 0, 255].hex.stringValues(withPrefix: true)   // ["0x00", "0xFF", "0x00", "0xFF"]
    func testIntArrayToHexStringValuesWithPrefix() {
        XCTAssertEqual([0, 255, 0, 255].hex.stringValues(withPrefix: true), ["0x00", "0xFF", "0x00", "0xFF"])
    }

    /// [0, 65535, 4000].hex.stringValue                      // "00 FFFF FA0"
    func testIntArrayToHexStringValue2() {
        XCTAssertEqual([0, 65535, 4000].hex.stringValue, "00 FFFF FA0")
    }
    
    /// [0, 65535, 4000].hex.stringValue(padToEvery: 4)       // "0000 FFFF 0FA0"
    func testIntArrayToHexStringValuePaddedTo4() {
        XCTAssertEqual([0, 65535, 4000].hex.stringValue(padToEvery: 4), "0000 FFFF 0FA0")
    }
    
    /// ["00", "FF", "ZZ"].valuesFromHexStrings               // [Optional(0), Optional(255), nil]
    func testHexStringArrayToIntValues() {
        XCTAssertEqual(["00", "FF", "ZZ"].valuesFromHexStrings, [0, 255, nil])
    }

    // MARK: - Nibbles: get, set, and bitwise shift
    
    /// var h = 0x1F.hex
    /// h[nibble: 0]                          // 0xF
    /// h[nibble: 1]                          // 0x1
    /// h[nibble: 1] = 0x7
    /// h.value                               // 0x7F
    func testNibbles() {
        var h = 0x1F.hex
        XCTAssertEqual(h.nibble(0), 0xF)
        XCTAssertEqual(h.nibble(1), 0x1)
        
        h[nibble: 1] = 0x7
        XCTAssertEqual(h.value, 0x7F)
    }

    /// 0x1F.hex <<<< 1       // 0x1F0 (bitwise nibble shift left)
    /// 0x10.hex >>>> 1            // 0x1   (bitwise nibble shift right)
    func testBitwiseNibbleShift() {
        XCTAssertTrue(0x1F.hex <<<< 1 == 0x1F0) // (bitwise nibble shift left)
        XCTAssertTrue(0x10.hex >>>> 1 ==   0x1) // (bitwise nibble shift right)
    }

    /// test for equatability with ultimate flexibility,
    /// without needing to extract the .value first, casting or converting
    func testEquality() {
        XCTAssertTrue(UInt8(123).hex == Int16(123)) // (can equate to any integer type, whether Hex<T> or not)
    }
    
    /// Constructors
    /// The Hex<T> struct acts as a shell around a type-preserved BinaryInteger:
    /// Hex(n) == Hex<T of n>(n)
    /// The Hex type can be constructed using initializers, or convenience extensions. Both are identical.
    func testIntContruction() {
        XCTAssertEqual(        Hex(123), Hex<Int>(123)    )
        XCTAssertEqual(         123.hex, Hex<Int>(123)    )
        XCTAssertEqual(    Int(123).hex, Hex<Int>(123)    )
        XCTAssertEqual(   Int8(123).hex, Hex<Int8>(123)   )
        XCTAssertEqual(  UInt8(123).hex, Hex<UInt8>(123)  )
        XCTAssertEqual(  Int16(123).hex, Hex<Int16>(123)  )
        XCTAssertEqual( UInt16(123).hex, Hex<UInt16>(123) )
        XCTAssertEqual(  Int32(123).hex, Hex<Int32>(123)  )
        XCTAssertEqual( UInt32(123).hex, Hex<UInt32>(123) )
        XCTAssertEqual(  Int64(123).hex, Hex<Int64>(123)  )
        XCTAssertEqual( UInt64(123).hex, Hex<UInt64>(123) )
    }

    
    /// A valid hexadecimal string can be used to construct the Hex<T> struct.
    /// This constructor returns an optional, since if the string is not valid hexadecimal, the constructor will fail and nil will be returned.
    /// If no integer type is specified, the type will defult to Hex<Int>.
    func testStringContruction() {
        XCTAssertEqual(  Hex("FF"), Hex<Int>(255) )
        XCTAssertEqual(   "FF".hex, Hex<Int>(255) )
        XCTAssertEqual( "0xFF".hex, Hex<Int>(255) )
        XCTAssertEqual( "ZZZZ".hex, nil            ) // not a valid hex string
    }
    
    /// To construct from a hex string to a specific desired internal integer value type, specify it in the constructor.
    func testTypedStringContruction() {
        XCTAssertEqual( Hex<UInt8>("FF")    , Hex<UInt8>(255) )
        XCTAssertEqual( Hex<UInt8>("FFFFFF"), nil             ) // nil -- 0xFFFFFF does not fit in UInt8, so init fails
    }

    // MARK: - Getting and Setting Values
    
    /// Once the Hex<T> object is constructed, various methods become available.
    func testVariousMethods() {
        var h = 255.hex      // Hex<Int>(255)
        
        XCTAssertEqual(h.value, 255)
        XCTAssertEqual(h.stringValue, "FF")
        XCTAssertEqual(h.stringValue(withPrefix: true), "0xFF")
        XCTAssertEqual(h.stringValue(withPrefix: true), "0xFF")
        
        h.stringValue = "7F" // can also set the hex String and get value...
        XCTAssertEqual(h.value, 127)
    }
    
    /// Padding to n number of leading zeros can be specified if you need uniform string formatting:
    func testPadding() {
        XCTAssertEqual(   0xF.hex.stringValue,              "F")
        XCTAssertEqual(   0xF.hex.stringValue(padTo: 2),   "0F")
        XCTAssertEqual(   0xF.hex.stringValue(padTo: 3),  "00F")
        XCTAssertEqual(0xFFFF.hex.stringValue(padTo: 3), "FFFF") // has no effect; it's > 3 places
        
        // It is also possible to pad leading zeros to every n multiple of digit places.
        XCTAssertEqual(    0xF.hex.stringValue(padToEvery: 2), "0F"      )
        XCTAssertEqual(   0xFF.hex.stringValue(padToEvery: 2), "FF"      )
        XCTAssertEqual(  0xFFF.hex.stringValue(padToEvery: 2), "0FFF"    )
        XCTAssertEqual( 0xFFFF.hex.stringValue(padToEvery: 2), "FFFF"    )
        XCTAssertEqual(    0x1.hex.stringValue(padToEvery: 4), "0001"    )
        XCTAssertEqual(0x12345.hex.stringValue(padToEvery: 4), "00012345")
    }
    
    func testNibble() {
        var h = 0x1234.hex
        XCTAssertEqual(h.nibble(0), 0x4) // (type T, which is Int in this case)
        XCTAssertEqual(h.nibble(3), 0x1) // (type T, which is Int in this case)
        
        XCTAssertEqual(h[nibble: 0], 0x4) // (type T, which is Int in this case)
        XCTAssertEqual(h[nibble: 3], 0x1)
        
        h[nibble: 3] = 0xF
        XCTAssertEqual(h.value, 0xF234)
    }
    
    /// .nibbleString(Int) .nibbleString(Int, padTo: Int)
    ///
    /// same as nibble(Int) but returns a hex String instead, optionally padded to specified number of places
    func testNibblePadding() {
        let h = 0x1234.hex
        
        XCTAssertEqual(h.nibbleString(0),            "4")
        XCTAssertEqual(h.nibbleString(3, padTo: 2), "01")
    }
    
    // MARK: - Equatability
    
    /// Hex<T> can be tested for equatability directly using typical operators (==, !=, >, <) without needing to access the .value property. This makes for cleaner, more convenient code.
    func testDirectEquality() {
        let h1 = 10.hex        // Hex<Int>
        let h2 = 20.hex        // Hex<Int>
        
        XCTAssertFalse(h1.value == h2.value) // this works but it's easier to just do this...
        XCTAssertFalse(h1 == h2)
        
        /// They can be compared with great flexibility -- even between different integer types directly without requiring casting or conversions.
        XCTAssertFalse(h1 > 20)         // (comparing Hex<Int> with Int)
        XCTAssertTrue(h1 < 20)          // (comparing Hex<Int> with Int)
        XCTAssertTrue(h1 != UInt8(20))  // (comparing Hex<Int> with UInt8)
        
        /// Even though "FF".hex produces an Optional, the comparison still works safely without requiring the optional to be unwrapped first
        XCTAssertTrue(255.hex == "FF".hex)  // true
        XCTAssertFalse(255.hex == "ZZ".hex) // false - optional is nil
    }

    
    // MARK: - Additional Operators supported, allowing mixing of types as with equatability:
    /// +=, -=, *=, /=, <<, >>, &
    
    
    // MARK: - Bitwise Shifting
    
    /// Traditional bit shift left/right still work as usual
    func testBitwiseShifting() {
        XCTAssertTrue(0b0100.hex << 1 == 0b1000)
        XCTAssertTrue(0b0100.hex >> 1 == 0b0010)
        
        /// nibble shift (multiples of 4 bits)
        XCTAssertTrue(0x2F.hex <<<< 1 == 0x2F0)     // (bitwise nibble shift left)
        XCTAssertTrue(0x2F.hex >>>> 1 == 0x2  )     // (bitwise nibble shift right)
        
        XCTAssertTrue(0xF0.hex >>>> 1 == 0xF     )  // (bitwise nibble shift right)
        XCTAssertTrue(0xF0.hex <<<< 4 == 0xF00000)  // (bitwise nibble shift left)
    }
    
    // MARK: - Extensions on Arrays
    
    /// Any [BinaryInteger] Array can be converted to an equivalent [Hex<T>] Array:
    func testArrayExtensions() {
        let a = [1, 2].hex                  // [Hex<Int>(1), Hex<Int>(2)]
        let uint8array: [UInt8] = [3, 4]
        let b = uint8array.hex              // [Hex<UInt8>(3), Hex<UInt8>(4)]
        
        XCTAssertEqual([UInt8](arrayLiteral: 5, 6).hex, [Hex<UInt8>(5), Hex<UInt8>(6)] ) // [Hex<UInt8>(5), Hex<UInt8>(6)]
        
        /// and back again:
        XCTAssertTrue(a.values == [1, 2])
        XCTAssertTrue(b.values == [3, 4])
        
        /// It can also be flattened into a concatenated String or an array of hex String:
        XCTAssertEqual([0, 255, 0, 255].hex.stringValue, "00 FF 00 FF")
        XCTAssertEqual([0, 255, 0, 255].hex.stringValues, ["00", "FF", "00", "FF"])
        
        XCTAssertEqual([0, 255, 0, 255].hex.stringValue(withPrefix: true), "0x00 0xFF 0x00 0xFF")
        XCTAssertEqual([0, 255, 0, 255].hex.stringValues(withPrefix: true), ["0x00", "0xFF", "0x00", "0xFF"])
        
        /// Which can be useful when debugging binary data to the console, or presenting binary data in a human-readable format easily:
        let d = Data([0x1, 0x2, 0x3, 0xFF])
        XCTAssertEqual([UInt8](d).hex.stringValue, "01 02 03 FF")
        
        /// String arrays can also be translated into an array of Hex<T>?.
        /// There is no .values property but you can easily render the array down, or iterate over it.
        XCTAssertEqual(["00", "0xFF", "ZZ"].hex.map({ $0?.value }), [0, 255, nil])
        XCTAssertEqual(["00", "0xFF", "ZZ"].hex.map({ $0?.value ?? -1 }), [0, 255, -1])
        
        /// or use the convenience property .hexValues
        XCTAssertEqual(["00", "0xFF", "ZZ"].valuesFromHexStrings, [0, 255, nil])
    }
    
    
    // MARK: - Limitations
    
    /// The max integer size storable and representable as a hex String is UInt64 which is the natural limitation of Swift.
    func testLimitations() {
        XCTAssertNotNil(Hex<UInt64>(0xFFFF_FFFF_FFFF_FFFF))              //Max 64 Bit Number
        XCTAssertTrue(Hex<UInt64>(0xFFFF_FFFF_FFFF_FFFF) == UInt64.max)  //True
        // FIXME: UInt64.Max Via String Init Fails...
        /// XCTAssertNotNil(Hex<UInt64>("FFFFFFFFFFFFFFF"))
        /// XCTAssertNil(Hex<UInt64>("FFFF_FFFF_FFFF_FFFF_FFFF"))
        
        /// Negative numbers will be stored in .value normally but may produce unexpected hex Strings.
        /// You do not have to exclusively use unsigned integers, but it's best to avoid using negative numbers which will have an ambigious hex representation.
        XCTAssertEqual((-1).hex.value, -1)
        XCTAssertTrue((-1).hex == -1)
        /// XCTAssertTrue((-1).hex == Hex<UInt64>(0xFFFF_FFFF_FFFF_FFFF))
    }

    static var allTests = [
        ("testIntToHexString", testIntToHexString),
        ("testIntToHexStringWithPrefix", testIntToHexStringWithPrefix),
        ("testHexStringToInt", testHexStringToInt),
        ("testHexStringWithPrefixToInt", testHexStringWithPrefixToInt),
        ("testInvalidHexStringToInt", testInvalidHexStringToInt),
        ("testIntArrayToHexStringValue", testIntArrayToHexStringValue),
        ("testIntArrayToHexStringValues", testIntArrayToHexStringValues),
        ("testIntArrayToHexStringValueWithPrefix", testIntArrayToHexStringValueWithPrefix),
        ("testIntArrayToHexStringValuesWithPrefix", testIntArrayToHexStringValuesWithPrefix),
        ("testIntArrayToHexStringValue2", testIntArrayToHexStringValue2),
        ("testIntArrayToHexStringValuePaddedTo4", testIntArrayToHexStringValuePaddedTo4),
        ("testHexStringArrayToIntValues", testHexStringArrayToIntValues),
        ("testNibbles", testNibbles),
        ("testBitwiseNibbleShift", testBitwiseNibbleShift),
        ("testEquality", testEquality),
        ("testIntContruction", testIntContruction),
        ("testStringContruction", testStringContruction),
        ("testTypedStringContruction", testTypedStringContruction),
        ("testVariousMethods", testVariousMethods),
        ("testPadding", testPadding),
        ("testNibble", testNibble),
        ("testNibblePadding", testNibblePadding),
        ("testDirectEquality", testDirectEquality),
        ("testBitwiseShifting", testBitwiseShifting),
        ("testArrayExtensions", testArrayExtensions),
        ("testLimitations", testLimitations)
    ]
}
