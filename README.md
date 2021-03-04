# SwiftRadix

<p>
<a href="https://developer.apple.com/swift">
<img src="https://img.shields.io/badge/Swift-5.2-blue.svg?style=flat"
     alt="Swift 5.2 compatible" /></a>
<a href="#installation">
<img src="https://img.shields.io/badge/SPM-5.3-blue.svg?style=flat"
     alt="Swift Package Manager (SPM) compatible" /></a>
<a href="https://developer.apple.com/swift">
<img src="https://img.shields.io/badge/platform-macOS_10.10_|_iOS_8_|_tvOS_9_|_watchOS_2-%23989898.svg?style=flat"
     alt="Platform - macOS 10.10 | iOS 8 | tvOS 9 | watchOS 2" /></a>
<a href="#documentation">
<img src="https://img.shields.io/badge/coverage-100%25-brightgreen.svg?style=flat"
     alt="Code Coverage - 100 Percent" /></a>
<a href="https://github.com/orchetect/SwiftRadix/blob/master/LICENSE">
<img src="http://img.shields.io/badge/license-MIT-green.svg?style=flat" 
     alt="License: MIT" /></a>
</p>


A lightweight library useful for translating integers to and from radix strings (binary, hex, octal or any base) using simple, clean functional syntax.

## Summary

### Common Usage

Unified library with several constructor methods, all of which in turn provide all of the functionality of the library inline.

| Option 1: Function   | Option 2: Category method | Returns                                 |
| -------------------- | ------------------------- | --------------------------------------- |
| `Radix(_: T, base:)` | `.radix(base:)`           | `Radix<T>(base: n)` where n is `2...36` |
| `Binary(_: T)`       | `.binary`                 | `Radix<T>(base: 2)`                     |
| `Octal(_: T)`        | `.octal`                  | `Radix<T>(base: 8)`                     |
| `Hex(_: T)`          | `.hex`                    | `Radix<T>(base: 16)`                    |

For the sake of simplifying this documentation, `Hex()` / `.hex` will be used for most examples below.

```swift
// convert to or from hex strings

255.hex.stringValue               // "FF"
255.hex.stringValue(prefix: true) // "0xFF"
"FF".hex?.value                   // Optional(255)
"0xFF".hex?.value                 // Optional(255)
"ZZ".hex?.value                   // nil (not valid hex string, so init fails)

// work with arrays of any integer type, or hex strings and convert between them

[0, 255, 0, 255].hex.stringValue                       // "00 FF 00 FF"
[0, 255, 0, 255].hex.stringValues                      // ["00", "FF", "00", "FF"]
[0, 255, 0, 255].hex.stringValue(prefixes: true)       // "0x00 0xFF 0x00 0xFF"
[0, 255, 0, 255].hex.stringValues(prefixes: true)      // ["0x00", "0xFF", "0x00", "0xFF"]

[0, 255, 0, 255].hex.stringValueArrayLiteral           // "[0x0, 0xFF, 0x0, 0xFF]"
[0, 255, 0, 255].hex.stringValueArrayLiteral(padTo: 2) // "[0x00, 0xFF, 0x00, 0xFF]"

[0, 65535, 4000].hex.stringValue                       // "0 FFFF FA0"
[0, 65535, 4000].hex.stringValue(padTo: 2)             // "00 FFFF FA0"
[0, 65535, 4000].hex.stringValue(padToEvery: 2)        // "00 FFFF 0FA0"
[0, 65535, 4000].hex.stringValue(padToEvery: 4)        // "0000 FFFF 0FA0"

["00", "FF", "ZZ"].hex.values                          // [Optional(0), Optional(255), nil]

// test for equatability or perform math operations with great flexibility,
// without needing to extract the .value first, casting or converting

UInt8(123).hex == Int16(123)      // true
"FF".hex == 255                   // true

123.hex + 10.binary - 10          // 123
```

## Installation

### Swift Package Manager (SPM)

To add SwiftRadix to your Xcode project:
1. Select File → Swift Packages → Add Package Dependency
2. Add package using  `https://github.com/orchetect/SwiftRadix` as the URL.

### Cocoapods

```bash
pod 'SwiftRadix'
```

## Documentation

### Premise

At its core, a new generic type called `Radix` wraps any `BinaryInteger` value, as well as its associated base (radix).

```swift
Radix<T: BinaryInteger>

// constructors

Radix(0xFF, base: 16)                // Radix<Int>(255)
Radix(UInt8(0xFF), base: 16)         // Radix<UInt8>(255)
Radix<UInt8>(0xFF, base: 16)         // Radix<UInt8>(255)

Radix(0b1111, base: 2)               // Radix<Int>(15)

// category method to construct

0xFF.radix(base: 16)                 // Radix<Int>(255)
0xFF.radix(base: 16, as: UInt8.self) // Radix<UInt8>(255)
```

However, for common bases (binary base-2, octal base-8, hex base-16) you may never need to construct `Radix` directly. Instead, there are convenient functional category methods on common types and collections to shortcut these.

```swift
255.binary            // == Radix<Int>(0b11111111, base: 2)
"0b11111111".binary   // == Radix<Int>(255, base: 2)?

255.octal             // == Radix<Int>(0o377, base: 8)
"0o377".octal         // == Radix<Int>(255, base: 8)?

255.hex               // == Radix<Int>(0xFF, base: 16)
"0xFF".hex            // == Radix<Int>(255, base: 16)?

255.radix(base: 5)    // == Radix<Int>(255, base: 5)
"2010".radix(base: 5) // == Radix<Int>(255, base: 5)?
```

You will see how powerful and elegant these can be when combined, further down the README.

### Proxy Constructors

Two invocation styles, producing the same result.

```swift
// proxy constructor function
Hex(123)                  // Radix<Int>(123, base: 16)

// functional category property
123.hex                   // Radix<Int>(123, base: 16)
```

Any `BinaryInteger` type can be used.

```swift
Int(123).hex              // Radix<Int>(123)
Int8(123).hex             // Radix<Int8>(123)
UInt8(123).hex            // Radix<UInt8>(123)
Int16(123).hex            // Radix<Int16>(123)
UInt16(123).hex           // Radix<UInt16>(123)
Int32(123).hex            // Radix<Int32>(123)
UInt32(123).hex           // Radix<UInt32>(123)
Int64(123).hex            // Radix<Int64>(123)
UInt64(123).hex           // Radix<UInt64>(123)
```

A valid hexadecimal string can be used, either containing the prefix `0x` or without it.

This constructor returns an `Optional`, since if the string is not valid hexadecimal, the constructor will fail and `nil` will be returned.

If no integer type is specified, the type will defult to `Int`.

```swift
Hex("FF")                 // Radix<Int>(255)?
"FF".hex                  // Radix<Int>(255)?
"0xFF".hex                // Radix<Int>(255)?

"ZZZZ".hex                // nil ; not a valid hex string
```

To specify an integer type other than `Int`, specify it using `as:`.

```swift
Hex("FF", as: UInt8.self)      // Radix<UInt8>(255)?
"FF".hex(as: UInt8.self)       // Radix<UInt8>(255)?

Hex("FFFFFF", as: UInt8.self)  // nil -- 0xFFFFFF does not fit in UInt8, so init fails
"FFFFFF".hex(as: UInt8.self)   // nil -- 0xFFFFFF does not fit in UInt8, so init fails
```

### Getting and Setting Values

Various methods become available:

```swift
let h = 255.hex                           // Radix<Int>(255)
h.value                                   // Int(255)
h.stringValue                             // "FF"
h.stringValue(prefix: true)               // "0xFF"

h.stringValue = "7F"                      // can also set the hex String and get value...
h.value                                   // 127, type Int
```

Padding to *n* number of leading zeros can be specified if you need uniform string formatting:

```swift
    0xF.hex.stringValue                   // "F"
    0xF.hex.stringValue(padTo: 2)         // "0F"
    0xF.hex.stringValue(padTo: 3)         // "00F"

 0xFFFF.hex.stringValue(padTo: 3)         // "FFFF" - has no effect; it's > 3 places
```

It is also possible to pad leading zeros to every *n* multiple of digit places.

```swift
    0xF.hex.stringValue(padToEvery: 2)    // "0F"
   0xFF.hex.stringValue(padToEvery: 2)    // "FF"
  0xFFF.hex.stringValue(padToEvery: 2)    // "0FFF"
 0xFFFF.hex.stringValue(padToEvery: 2)    // "FFFF"

    0x1.hex.stringValue(padToEvery: 4)    // "0001"
0x12345.hex.stringValue(padToEvery: 4)    // "00012345"
```

In addition to padding, strings can be split every *n* digit places, and also in combination with padding.

```swift
    0xF.hex.stringValue(padTo: 8, splitEvery: 4)         // "0000 000F"
0x123AB.hex.stringValue(padToEvery: 2, splitEvery: 2)    // "01 23 AB"
```

### Equatability

`Radix<T>` can be tested for equatability directly using typical operators (`==`, `!=`, `>`, `<`) without needing to access the `.value` property. This makes for cleaner, more convenient syntax.

```swift
let h1 = 10.hex        // Radix<Int>
let h2 = 20.hex        // Radix<Int>

h1.value == h2.value   // this works but it's easier to just do this...
h1 == h2               // false
```

They can be compared with great flexibility -- even between different integer types directly without requiring casting or conversions.

```swift
let h1 = 10.hex        // Radix<Int>
let h2 = 20.hex        // Radix<Int>
h1 == h2               // false  (comparing Radix<Int> with Radix<Int>)
h1 > 20                // true   (comparing Radix<Int> with Int)
h1 != UInt8(20)        // true   (comparing Radix<Int> with UInt8)

// even though "FF".hex produces an Optional,
// the comparison still works safely without requiring the optional to be unwrapped first
"FF".hex == 255        // true
"FF".hex == 255.hex    // true
"ZZ".hex == 255.hex    // false - optional is nil
```

### Additional Operators

Additional operators similarly supported, allowing mixing of types as with equatability:

- `+=`, `-=`, `*=`, `/=`, `<<`, `>>`, `&`

### Bitwise Shifting

#### Traditional Bit Shift

Traditional binary bit shift left/right still work as usual.

```swift
0b0100.hex << 1        // 0b1000
0b0100.hex >> 1        // 0b0010
```

#### Nibble Shift

Shift in multiples of 4 bits with new `<<<<` / `>>>>` operators.

```swift
0x2F.hex <<<< 1        // 0x2F0    (bitwise nibble shift left)
0x2F.hex >>>> 1        // 0x2      (bitwise nibble shift right)

0xF0.hex >>>> 1        // 0xF      (bitwise nibble shift right)
0xF0.hex <<<< 4        // 0xF00000 (bitwise nibble shift left)
```

### Extensions on Array and Data

#### [BinaryInteger]

Any integer array can be converted to an equivalent `[Radix<T>]` Array:

```swift
let a = [1, 2].hex           // [Radix<Int>(1), Radix<Int>(2)]

let arr: [UInt8] = [3, 4]
let b = arr.hex              // [Radix<UInt8>(3), Radix<UInt8>(4)]

// and back again:

a.values                     // [1, 2] of type [Int]
b.values                     // [3, 4] of type [UInt8]
```

It can also be flattened into a concatenated `String` or an array of `String`s:
```swift
[0, 255, 0, 255].hex.stringValue                 // "00 FF 00 FF"
[0, 255, 0, 255].hex.stringValue(prefix: true)   // "0x00 0xFF 0x00 0xFF"

[0, 255, 0, 255].hex.stringValues                // ["00", "FF", "00", "FF"]
[0, 255, 0, 255].hex.stringValues(prefix: true)  // ["0x00", "0xFF", "0x00", "0xFF"]
```

#### [String]

`String` arrays can also be translated into an array of `Radix<T>?` . The `.values` property produces an unwrapped array of `[Optional<T>]`.

```swift
["00", "0xFF", "ZZ"].hex.values   // [Optional(0), Optional(255), nil]
```

It is also possible to easily generate a Swift source-compatible array literal.

```swift
let arr = [0, 1, 255]

arr.hex.stringValueArrayLiteral    // "[0x0, 0x1, 0xFF]"
arr.binary.stringValueArrayLiteral // "[0b0, 0b1, 0b11111111]"
```

#### Data

Useful when debugging binary data to the console, or presenting it in a human-readable format easily.

```swift
let d = Data([0x1, 0x2, 0x3, 0xFF])

d.hex.stringValue(padTo: 2)                          // "01 02 03 FF"
```

### Value Memory Access Methods

A numer of additional methods for reading and manipulating the underlying integer value.

#### Bit

`.bit(Int)`
`[bit: Int]`

- gets single bit value at specified position right-to-left
- subscript can also be used to get or set bit values
- radix-agnostic

```swift
var h = 0b1100.binary

h.bit(0)                  // 0b0.binary
h.bit(2)                  // 0b1.binary

h[bit: 0]                 // 0b0 (type T, which is Int in this case)
h[bit: 2]                 // 0b1 (type T, which is Int in this case)
h[bit: 2] = 0b0
h.value                   // == 0b1000
```

#### Nibble

`.nibble(Int)`
`[nibble: Int] { get set }`

- gets nibble (4-bit) value at specified position right-to-left
- subscript can also be used to get or set nibble values
- radix-agnostic

```swift
var h = 0x1234.hex

h.nibble(0)               // 0x4.hex
h.nibble(3)               // 0x1.hex

h[nibble: 0]              // 0x4 (type T, which is Int in this case)
h[nibble: 3]              // 0x1 (type T, which is Int in this case)
h[nibble: 3] = 0xF
h.value                   // == 0xF234
```

#### Bytes

`.bytes`

- A convenience property to return the raw bytes of the value as `[Uint8]` right-to-left
- radix-agnostic

```swift
let bytes = 0xFF00.hex.bytes

bytes // [0x00, 0xFF]
```

## Author

Coded by a bunch of 🐹 hamsters in a trench coat that calls itself [@orchetect](https://github.com/orchetect).

## License

Licensed under the MIT license. See [LICENSE](https://github.com/orchetect/SwiftRadix/blob/master/LICENSE) for details.

This library was formerly known as SwiftHex.

## Contributions

Contributions are welcome. Feel free to post an Issue to discuss.
