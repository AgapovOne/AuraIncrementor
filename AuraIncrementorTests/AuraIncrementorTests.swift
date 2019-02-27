//
//  AuraIncrementorTests.swift
//  AuraIncrementorTests
//
//  Created by Alex Agapov on 27/02/2019.
//  Copyright © 2019 AgapovOne. All rights reserved.
//

import XCTest
@testable import AuraIncrementor

class AuraIncrementorPublicInterfaceTests: XCTestCase {

    // MARK: Get Number
    func testGetNumber() {
        let valueToCheck = 0

        let incrementor = Incrementor()

        XCTAssertEqual(incrementor.number, valueToCheck, "Value should be minimum after initialization")
    }

    func testGetNumberWithValidValue() {
        let valueToCheck = 666
        Incrementor.Constants.defaultMinimumValue = valueToCheck

        let incrementor = Incrementor()

        XCTAssertEqual(incrementor.number, valueToCheck, "Value should be minimum after initialization")
    }

    func testGetNumberWithDefaultValue() {
        let valueToCheck = Incrementor.Constants.defaultMinimumValue

        let incrementor = Incrementor()

        XCTAssertEqual(incrementor.number, valueToCheck, "Value should be minimum after initialization")
    }

    // MARK: Increment number
    func testIncrementNumberReturnsPreviousPlusOne() {
        let newNumber = Incrementor.Constants.defaultMinimumValue + 1
        let incrementor = Incrementor()

        incrementor.increment()

        XCTAssertEqual(incrementor.number, newNumber)
    }

    // MARK: Set maximum number
    func testSetMaximumValue() {
        let maximumValue = 10
        let incrementor = Incrementor()

        try! incrementor.setMaximumValue(maximumValue)

        XCTAssertEqual(incrementor.maximumValue, maximumValue)
    }

    func testMaximumValueResetsNumberToZero() {
        let maximumValue = 1
        let incrementor = Incrementor()

        try! incrementor.setMaximumValue(maximumValue)
        incrementor.increment() // 1
        incrementor.increment() // 

        XCTAssertEqual(incrementor.maximumValue, maximumValue)
    }
}
