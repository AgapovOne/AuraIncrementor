//
//  IncrementorPublicInterfaceTests.swift
//  AuraIncrementorTests
//
//  Created by Alex Agapov on 27/02/2019.
//  Copyright © 2019 AgapovOne. All rights reserved.
//

import XCTest
@testable import AuraIncrementor

class IncrementorPublicInterfaceTests: XCTestCase {

    // MARK: - Unit tests
    // MARK: Get Number
    func testGetNumber() {
        let minimumValue = 0

        let incrementor = Incrementor()

        XCTAssertEqual(incrementor.number, minimumValue, "Value should be minimum after initialization")
    }

//    func testGetNumberWithValidValue() {
//        let valueToCheck = 666
//        Incrementor.Constants.defaultMinimumValue = valueToCheck
//
//        let incrementor = Incrementor()
//
//        XCTAssertEqual(incrementor.number, valueToCheck, "Value should be minimum after initialization")
//    }
//
//    func testGetNumberWithDefaultValue() {
//        let valueToCheck = Incrementor.Constants.defaultMinimumValue
//
//        let incrementor = Incrementor()
//
//        XCTAssertEqual(incrementor.number, valueToCheck, "Value should be minimum after initialization")
//    }

    // MARK: Increment number
    func testIncrementNumberReturnsPreviousPlusOne() {
//        let newNumber = Incrementor.Constants.minimumValue + 1
        let newNumber = 1
        let incrementor = Incrementor()

        incrementor.increment()

        XCTAssertEqual(incrementor.number, newNumber)
    }

    // MARK: Set maximum number
    func testSetMaximumValue() {
        let maximumValue = 10
        let incrementor = Incrementor()

        do {
            try incrementor.setMaximumValue(maximumValue)

            XCTAssertEqual(incrementor.maximumValue, maximumValue)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }

    func testShouldNotAllowSetMaximumNumberToLessThanZeroWithDescriptiveError() {
        let maximumValue = -5
        let incrementor = Incrementor()

        do {
            try incrementor.setMaximumValue(maximumValue)
            XCTFail("Shouldn't allow to set up value below zero. Trying to set \(maximumValue)")
        } catch let error as IncrementorError {
            print(error.localizedDescription)
            XCTAssertEqual(error.localizedDescription.isEmpty, false)
        } catch {
            XCTFail("Error should be of type IncrementorError")
        }
    }

    // MARK: - Integration tests
    func testIncrementationWithMaximumValueReachsMaximumValue() {
        let maximumValue = 1
        let incrementor = Incrementor()

        do {
            try incrementor.setMaximumValue(maximumValue)
            incrementor.increment() // 1

            XCTAssertEqual(incrementor.number, maximumValue)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }

    func testIncrementationWithMaximumValueResetsNumberToZero() {
        let minimumValue = 0
        let maximumValue = 1

        let incrementor = Incrementor()

        do {
            try incrementor.setMaximumValue(maximumValue)
            incrementor.increment() // 1
            incrementor.increment() // 0

            XCTAssertEqual(incrementor.number, minimumValue)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }

    func testIncrementationWithMaximumValueWillContinueAfterReset() {
        let maximumValue = 2

        let incrementor = Incrementor()

        do {
            try incrementor.setMaximumValue(maximumValue)
            incrementor.increment() // 1
            incrementor.increment() // 2
            incrementor.increment() // 0
            incrementor.increment() // 1

            XCTAssertEqual(incrementor.number, 1)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }

    func testShouldResetNumberAfterSettingMaximumValueBelowCurrentNumber() {
        let maximumValue = 1

        let incrementor = Incrementor()

        incrementor.increment() // 1
        incrementor.increment() // 2
        incrementor.increment() // 3

        do {
            try incrementor.setMaximumValue(maximumValue)

            XCTAssertEqual(incrementor.number, 0)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }
}
