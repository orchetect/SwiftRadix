//
//  Hex.swift
//  SwiftHex
//
//  Created by Steffan Andrews on 2017-12-29.
//  MIT License
//  https://github.com/orchetect/SwiftHex
//

import Foundation

/**
A lightweight value type for storing hexadecimal string-representable integer values of any type, with constructors from all integer types or from a hex String, and methods to examine and manipulate data in base-16.

**Capabilities/Limits**

The max integer size storable and representable as a hex String is:

`Hex<UInt64>(0xFFFF_FFFF_FFFF_FFFF)`

**Constructors**

`Hex(n)` == `Hex<T of n>(n)`
- `.value` is type-inferred from integer type used in constructor

`Hex("FF")` == `Optional(Hex<Int>(255))`
- Optional because invalid hex strings may fail conversion to an integer
- if no type is specified, Int is used by default.

`Hex<UInt8>("FF")` == `Optional(Hex<UInt8>(255))`
- Specifies integer type to use when converting hex String to `.value`

**Methods**

`stringValue`
- set and get `.value` to/from a hex String

`stringValue(pad: Int)`
- same as `stringValue` getter, but pads the hex String to specified number of places

`nibble(Int)`
`[nibble: Int] { get set }`
- gets or sets nibble value at specified zero-based position right-to-left

`nibbleString(Int, padTo: Int)`
- same as nibble(Int) but returns a hex String instead, optionally padded to specified number of places

**Operators**

Hex structs can be compared with typical operators (`==, !=, >, <`), even between different `.value` integer types. It is also possible to mix normal integer types when doing these comparisons, such as `Hex<Int>` on one side and `UInt8` on the other side:

```
let h1 = 10.hex				// Hex<Int>
let h2 = 20.hex				// Hex<Int>
h1 == h2					// comparing Hex<Int> with Hex<Int>
h1 == 20					// comparing Hex<Int> with Int
h1 != UInt8(20)				// comparing Hex<Int> with UInt8
```

Additional operators similarly supported:
- `+=, -=, *=, /=, >>, <<, &`

**Extensions on other types**

Any `BinaryInteger` type can be constructed into a `Hex<>` struct:
```
123.hex                    // Hex<Int>(123)
UInt16(123).hex            // Hex<Int16>(123)
```

Any `String` can be constructed into a `Hex<>?` with default type `Int`:
```
"FF".hex                   // Hex<Int>(255)?
```

Any `[BinaryInteger]` Array can be converted to an equivalent `[Hex<>]` Array:
```
[1, 2].hex                 // [Hex<Int>(1), Hex<Int>(2)]

```

And back again:
```
[1.hex, 2.hex].values      // [Int] == [1, 2]

let arr1: [UInt8] = [1, 2]
let arr2 = arr1.hex        // [Hex<UInt8>(1), Hex<UInt8>(2)]
let arr3 = arr2.values     // [UInt8] == [1, 2]
```

It can also be flattened into a concatenated String:
```
[1.hex, 255.hex].stringValue(pad: 2) // "01 FF"
```
*/
public struct Hex<T: BinaryInteger>: HexStringRepresentable {
	public typealias NumberType = T
	
	/// Actual integer value. Can set and get directly.
	public var value: NumberType = 0
	
	/// Construct from a number, preserving the number's type in `value` variable.
	public init (_ number: NumberType) {
		value = number
	}
	
	/// Construct from a hex string.
	/// `Hex("FF")` or `Hex("0xFF")` - Stores `value` as Int type by default.
	/// To specify number type, construct as `Hex<Int8>("FF")` for example.
	public init? (_ hexString: String) {
		guard let convertedValue = hexStringToValue(parsing: hexString) else { return nil }
		value = convertedValue
	}
	
	/// Computed property: Getter returns hex String representation of `value`. Setter assigns `value` to numeric equivalent of hex String.
	public var stringValue: String {
		get {
			guard let number = Int(exactly: value) else { return "" }
			return String(format:"%llX", number) // %ll can represent 64-bit, otherwise % truncates at 32-bit
		}
		set {
			guard let convertedValue = hexStringToValue(parsing: newValue) else { return }
			value = convertedValue
		}
	}
	
	/// Internal function to convert a hex String to a value. Fails with nil if not successful or if the hex String is malformed.
	private func hexStringToValue(parsing hexString: String) -> NumberType? {
		var parseString: Substring
		
		if hexString.starts(with: "0x") {			// case-sensitive; only 0x is valid - 0X is not allowed
			parseString = hexString.dropFirst(2)	// produces a view on hexString, not a copy
		} else {
			parseString = hexString.dropFirst(0)	// produces a view on hexString, not a copy
		}
		
		guard let convertedValue = Int(parseString, radix: 16) else { return nil }			// fails if non-conformant to the radix (a malformed hex String)
		guard let castedValue = NumberType(exactly: convertedValue) else { return nil }		// fails if the number overflows the integer type
		return castedValue
	}
	
	/// Computed property: returns hex String representation of `value`, padding zeros to number of places passed.
	public func stringValue(padTo: Int = 2, withPrefix: Bool = false) -> String {
		guard let number = Int(exactly: value) else { return "" }
		return (withPrefix ? "0x" : "") + String(format:"%ll0\(padTo)X", number) // %ll can represent 64-bit, otherwise % truncates at 32-bit
	}
	/// Computed property: returns hex String representation of `value`, padded to multiples of specified number of characters.
	public func stringValue(padToEvery: Int, withPrefix: Bool = false) -> String {
		guard let number = Int(exactly: value) else { return "" }
		let hexString = String(format: "%ll0X", number) // %ll can represent 64-bit, otherwise % truncates at 32-bit
		return (withPrefix ? "0x" : "") + String(repeatElement("0", count: hexString.count.roundedUp(divisibleBy: padToEvery) - hexString.count)) + hexString
	}
	
	/// Computed property: returns decimal value of hex digit at zero-based `position` from right-to-left. Nibbles can also be get or set via the [nibble: Int] subscript.
	public func nibble(_ position: Int) -> NumberType {
		return (value & (0xF << (4 * NumberType(position)))) >> (4 * NumberType(position))
	}
	/// Computed property: returns string form of hex digit at zero-based `position` from right-to-left, with no padding zeros.
	public func nibbleString(_ position: Int, withPrefix: Bool = false) -> String {
		return (withPrefix ? "0x" : "") + self.nibbleString(position, padTo: 1)
	}
	/// Computed property: returns string form of hex digit at zero-based `position` from right-to-left, padding zeros to number of places passed.
	public func nibbleString(_ position: Int, padTo: Int, withPrefix: Bool = false) -> String {
		guard let number = Int(exactly: nibble(position)) else { return "" }
		return (withPrefix ? "0x" : "") + String(format:"%ll0\(padTo)X", number) // %ll can represent 64-bit, otherwise % truncates at 32-bit
	}
	/// Computed property: returns string form of hex digit at zero-based `position` from right-to-left, padded to multiples of specified number of characters passed in `padToEvery`.
	public func nibbleString(_ position: Int, padToEvery: Int, withPrefix: Bool = false) -> String {
		guard let number = Int(exactly: nibble(position)) else { return "" }
		let hexString = String(format: "%ll0X", number) // %ll can represent 64-bit, otherwise % truncates at 32-bit
		return (withPrefix ? "0x" : "") + String(repeatElement("0", count: hexString.count.roundedUp(divisibleBy: padToEvery) - hexString.count)) + hexString
	}
	
	public subscript(nibble nib: Int) -> NumberType {
		get {
			return self.nibble(nib)
		}
		set {
			if newValue < 0x0 || newValue > 0xF { return } // ensure nibble is valid
			
			let mask = value & (0b1111 << (4 * NumberType(nib))) // obtain old nibble value
			let setValue = (value - mask) + (newValue << (4 * nib)) // subtract old value and add new nibble value
			
			value = setValue
		}
	}
	
	/** Convenience computed property: returns a byte array from the `Hex` value, from right-to-left. All bytes for the integer are returned, since they are fixed-width numbers (ie: UInt8 returns one byte, but Int returns 8 bytes!)
	
	```
	UInt8(0xFF).hex.bytes // [0xFF]
	UInt16(0xFF).hex.bytes // [0xFF, 0x00]
	Int(0xFF).hex.bytes // [0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00]
	
	// so obviously for all of the above:
	bytes[0] == 0xFF
	```
	*/
	public var bytes: [UInt8] {
		var value = self
		return withUnsafeBytes(of: &value) { Array($0) }
	}
}
