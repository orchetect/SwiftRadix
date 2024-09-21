//
//  Radix Protocol Adoptions Tests.swift
//  SwiftRadix • https://github.com/orchetect/SwiftRadix
//  © 2022-2024 Steffan Andrews • Licensed under MIT License
//

import XCTest
import SwiftRadix

final class RadixProtocolAdoptionsTests: XCTestCase {
    func testRadix_CustomStringConvertible() {
        // CustomStringConvertible
        
        // binary
        
        XCTAssertEqual(
            String(describing: 1.binary),
            "0b1"
        )
        XCTAssertEqual(
            1.binary.description,
            "0b1"
        )
        
        // hex
        
        XCTAssertEqual(
            String(describing: 1.hex),
            "0x1"
        )
        XCTAssertEqual(
            1.hex.description,
            "0x1"
        )
        
        // octal
        
        XCTAssertEqual(
            String(describing: 1.octal),
            "0o1"
        )
        XCTAssertEqual(
            1.octal.description,
            "0o1"
        )
        
        // CustomDebugStringConvertible
        
        // binary
        
        XCTAssertEqual(
            1.binary.debugDescription,
            "Radix<Int>(0b1)"
        )
        
        // hex
        
        XCTAssertEqual(
            1.hex.debugDescription,
            "Radix<Int>(0x1)"
        )
        
        // octal
        
        XCTAssertEqual(
            1.octal.debugDescription,
            "Radix<Int>(0o1)"
        )
    }
    
    func testRadix_Hashable() {
        // Dictionary - [Key : Hashable]
        
        var dict: [String: Radix<Int>] = [:]
        
        dict.updateValue(1.hex, forKey: "value1")
        
        XCTAssertEqual(dict["value1"]!.value, 1)
        
        // Set - Hashable
        
        var set: Set = [1.hex]
        
        set.update(with: 1.hex)
        
        XCTAssertEqual(set.count, 1) // should recognize the dupe was not added
        
        set.update(with: 2.hex)
        
        XCTAssertEqual(set.count, 2)
    }
}
